import 'package:audioplayers/audioplayers.dart';

class SoundManager {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isSoundOn = true;

  SoundManager() {
    _playBackgroundMusic();
  }

  void _playBackgroundMusic() async {
    await audioPlayer.play(AssetSource('music.mp3'));
    audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  void toggleSound() {
    if (isSoundOn) {
      audioPlayer.stop();
    } else {
      _playBackgroundMusic();
    }
    isSoundOn = !isSoundOn;
  }

  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
  }
}