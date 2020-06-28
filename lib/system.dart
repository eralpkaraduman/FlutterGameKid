import 'package:flutter/material.dart';
import 'package:flutterKid/bootAnimation.dart';
import 'dart:async';

class System {
  static final System _singleton = System._internal();

  Widget _loadedGame;

  // ignore: close_sinks
  StreamController<Widget> _loadedGameStreamController =
      StreamController<Widget>();
  Stream<Widget> get loadedGameStream => _loadedGameStreamController.stream;

  factory System() {
    return _singleton;
  }

  void loadCartridge(Widget cartridgeWidget) {
    _loadedGame = BootAnimation(
      onComplete: () async {
        _loadedGame = cartridgeWidget;
        updateStreams();
      },
    );
    updateStreams();
  }

  void updateStreams() {
    _loadedGameStreamController.sink.add(_loadedGame);
  }

  System._internal();
}
