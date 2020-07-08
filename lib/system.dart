import 'package:flutter/material.dart';
import 'package:flutterKid/bootAnimation.dart';
import 'dart:async';

class System {
  static final System _singleton = System._internal();

  Widget _loadedGame;

  // ignore: close_sinks
  StreamController<Widget> _loadedGameStreamController =
      StreamController<Widget>.broadcast();
  Stream<Widget> get loadedGameStream => _loadedGameStreamController.stream;

// ignore: close_sinks
  StreamController<bool> _cartridgeInsertedStreamController =
      StreamController<bool>.broadcast();
  Stream<bool> get cartridgeInsertedStream =>
      _cartridgeInsertedStreamController.stream;

  factory System() {
    return _singleton;
  }

  void _unloadCartridge() {
    _loadedGame = Container();
    _loadedGameStreamController.sink.add(_loadedGame);
  }

  void loadCartridge(Widget cartridgeWidget) {
    _cartridgeInsertedStreamController.sink.add(cartridgeWidget != null);
    _unloadCartridge();
    Future.delayed(Duration(seconds: 1), () {
      bool empty = cartridgeWidget == null;
      _loadedGame = BootAnimation(
        noCartridge: empty,
        onComplete: () async {
          if (!empty) {
            _loadedGame = cartridgeWidget;
            _loadedGameStreamController.sink.add(_loadedGame);
          }
        },
      );
      _loadedGameStreamController.sink.add(_loadedGame);
    });
  }

  // void updateStreams() {
  //   _loadedGameStreamController.sink.add(_loadedGame);
  // }

  System._internal();
}
