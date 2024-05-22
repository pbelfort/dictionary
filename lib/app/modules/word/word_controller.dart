import 'package:dictionary/app/base/shared/application_controller.dart';
import 'package:dictionary/app/domain/entities/word_entity.dart';
import 'package:get/get.dart';

import '../../base/adapters/audio/audioplayers/audio_player_adapter.dart';
import '../../data/repository/word/i_word_repository.dart';

class WordController extends ApplicationController {
  final WordEntity wordParameter = Get.arguments['wordEntity']!;
  final audioAdapter = AudioAdapter();

  RxBool favorited = false.obs;

  final IWordRepository iWordRepository;

  WordController({
    required this.iWordRepository,
  });

  @override
  onInit() async {
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
    await iWordRepository.favorite(wordParameter.word);
    _checkFavorites();
  }

  Future<void> _checkFavorites() async {
    final favoritedList = await iWordRepository.getAllFavorites();
    favorited.value = favoritedList.contains(wordParameter.word);
  }
}
