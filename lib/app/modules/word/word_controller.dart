import 'package:dictionary/app/base/shared/application_controller.dart';
import 'package:dictionary/app/domain/entities/favorited_entity.dart';
import 'package:dictionary/app/domain/entities/historic_entity.dart';
import 'package:dictionary/app/domain/entities/word_entity.dart';
import 'package:dictionary/app/domain/usecases/historic_usecases.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../base/adapters/audio/audioplayers/audio_player_adapter.dart';
import '../../data/repository/favorite/i_favorite_repository.dart';
import '../../data/repository/historic/i_historic_repository.dart';
import '../../domain/usecases/favorite_usecases.dart';

class WordController extends ApplicationController {
  final WordEntity wordParameter = Get.arguments['wordEntity']!;
  final audioAdapter = AudioAdapter();
  Rx<Duration> durationPlayer = const Duration().obs;
  Rx<Duration> positionPlayer = const Duration().obs;

  RxBool favorited = false.obs;

  final IHistoricRepository iHistoricRepository;
  final IFavoriteRepository iFavoriteRepository;

  User? user;

  WordController({
    required this.iHistoricRepository,
    required this.iFavoriteRepository,
  });

  @override
  onInit() async {
    user ??= firebaseAdapter.getUser();
    _store();
    _checkFavorites();
    super.onInit();
  }

  Future<void> play() async {
    final audioUrl = wordParameter.phonetics
        .firstWhere((phonetic) => phonetic.audio.isNotEmpty)
        .audio;

    await audioAdapter.play(audioUrl);
  }

  Future<void> favorite() async {
    final favorited = FavoritedEntity(
      uuidUser: user!.uid,
      word: wordParameter.word,
    );
    await FavoriteUsecases.favorite(
      iFavoriteRepository: iFavoriteRepository,
      favorited: favorited,
    );

    _checkFavorites();
  }

  Future<void> _store() async {
    final historicEntity = HistoricEntity(
      uuidUser: user!.uid,
      word: wordParameter.word,
      dateTime: DateTime.now(),
    );
    await HistoricUsecases.store(
      iHistoricRepository: iHistoricRepository,
      historic: historicEntity,
    );
  }

  Future<void> _checkFavorites() async {
    final favoritedList =
        await FavoriteUsecases.getAllFavorites(iFavoriteRepository);
    favorited.value =
        favoritedList.any((favorited) => favorited.word == wordParameter.word);
  }

  void backAction() {
    Get.back();
  }
}
