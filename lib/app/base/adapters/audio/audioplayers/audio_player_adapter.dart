import 'package:audioplayers/audioplayers.dart';

import 'i_audio_player_adapter.dart';

class AudioAdapter implements IAudioAdapter {
  final player = AudioPlayer();

  @override
  Future<void> play(String audioUrl) async {
    await player.play(
      UrlSource(audioUrl),
    );
  }
}
