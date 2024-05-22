import 'package:dictionary/app/base/shared/application_controller.dart';
import 'package:dictionary/app/domain/entities/word_entity.dart';
import 'package:get/get.dart';

import '../../base/adapters/audio/audioplayers/audio_player_adapter.dart';

class WordController extends ApplicationController {
  final WordEntity wordParameter = Get.arguments['wordEntity']!;
  final audioAdapter = AudioAdapter();

  Future<void> play() async {
    final audioUrl = wordParameter.phonetics
        .firstWhere((phonetic) => phonetic.audio.isNotEmpty)
        .audio;

    await audioAdapter.play(audioUrl);
  }
}
