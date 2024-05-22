import 'package:dictionary/app/base/shared/application_controller.dart';
import 'package:dictionary/app/domain/entities/favorited_entity.dart';
import 'package:dictionary/app/domain/entities/historic_entity.dart';
import 'package:dictionary/app/domain/entities/word_entity.dart';
import 'package:get/get.dart';

import '../../base/adapters/audio/audioplayers/audio_player_adapter.dart';
import '../../data/repository/word/i_word_repository.dart';

class WordController extends ApplicationController {
  final WordEntity wordParameter = Get.arguments['wordEntity']!;
  final audioAdapter = AudioAdapter();
  Rx<Duration> durationPlayer = const Duration().obs;
  Rx<Duration> positionPlayer = const Duration().obs;

  RxBool favorited = false.obs;

  final IWordRepository iWordRepository;

  WordController({
    required this.iWordRepository,
  });

  @override
  onInit() async {
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
      uuidUser: 'uuidUser',
      word: wordParameter.word,
    );
    await iWordRepository.favorite(favorited);
    _checkFavorites();
  }

  _store() async {
    final historicEntity = HistoricEntity(
      uuidUser: 'uuidUser',
      word: wordParameter.word,
      dateTime: DateTime.now(),
    );
    await iWordRepository.store(historicEntity);
  }

  Future<void> _checkFavorites() async {
    final favoritedList = await iWordRepository.getAllFavorites();
    favorited.value =
        favoritedList.any((favorited) => favorited.word == wordParameter.word);
  }

  void backAction() {
    Get.back();
  }
}
