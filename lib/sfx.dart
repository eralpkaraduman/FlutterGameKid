import 'package:soundpool/soundpool.dart';
import 'package:flutter/services.dart';

class Sfx {
  Soundpool _pool = Soundpool(streamType: StreamType.notification);
  static final Sfx _singleton = Sfx._internal();
  int _soundIdButton1,
      _soundIdButton1stream,
      _soundIdButton2,
      _soundIdButton2stream,
      _soundIdBlip,
      _soundIdBlipStream,
      _soundIdStart,
      _soundIdStartStream,
      _soundIdGameBoyStart,
      _soundIdGameBoyStartStream;

  factory Sfx() {
    return _singleton;
  }

  void loadSounds() async {
    _soundIdButton1 = await rootBundle
        .load("assets/sounds/button1.mp3")
        .then((ByteData soundData) {
      return _pool.load(soundData);
    });
    _soundIdButton2 = await rootBundle
        .load("assets/sounds/button2.mp3")
        .then((ByteData soundData) {
      return _pool.load(soundData);
    });
    _soundIdBlip = await rootBundle
        .load("assets/sounds/blip.mp3")
        .then((ByteData soundData) {
      return _pool.load(soundData);
    });
    _soundIdStart = await rootBundle
        .load("assets/sounds/start.mp3")
        .then((ByteData soundData) {
      return _pool.load(soundData);
    });
    _soundIdGameBoyStart = await rootBundle
        .load("assets/sounds/gameboy-start.mp3")
        .then((ByteData soundData) {
      return _pool.load(soundData);
    });
  }

  void playButton1() async {
    if (_soundIdButton1stream != null) {
      await _pool.stop(_soundIdButton1stream);
    }
    _soundIdButton1stream = await _pool.play(_soundIdButton1);
  }

  void playButton2() async {
    if (_soundIdButton2stream != null) {
      await _pool.stop(_soundIdButton2stream);
    }
    _soundIdButton2stream = await _pool.play(_soundIdButton2);
  }

  void playBlip() async {
    if (_soundIdBlipStream != null) {
      await _pool.stop(_soundIdBlipStream);
    }
    _soundIdBlipStream = await _pool.play(_soundIdBlip);
  }

  void playStart() async {
    if (_soundIdStartStream != null) {
      await _pool.stop(_soundIdStartStream);
    }
    _soundIdStartStream = await _pool.play(_soundIdStart);
  }

  void playGameBoyStart() async {
    if (_soundIdGameBoyStartStream != null) {
      await _pool.stop(_soundIdGameBoyStartStream);
    }
    _soundIdGameBoyStartStream = await _pool.play(_soundIdGameBoyStart);
  }

  Sfx._internal();
}
