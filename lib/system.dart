import 'package:flutter/material.dart';
import 'package:flutterKid/bootAnimation.dart';
import 'dart:async';

class System {
  static final System _singleton = System._internal();

  // ignore: close_sinks
  StreamController<Widget> _loadedGameStreamController =
      StreamController<Widget>.broadcast();
  Stream<Widget> get loadedGameStream => _loadedGameStreamController.stream;
  Widget _loadedGame;

// ignore: close_sinks
  StreamController<bool> _cartridgeInsertedStreamController =
      StreamController<bool>.broadcast();
  Stream<bool> get cartridgeInsertedStream =>
      _cartridgeInsertedStreamController.stream;
  bool _cartridgeInserted = false;

  factory System() {
    return _singleton;
  }

  System._internal() {
    _cartridgeInsertedStreamController.sink.add(false);
    _loadedGameStreamController.sink.add(null);
  }

  void loadCartridge(Widget cartridgeWidget) {
    _cartridgeInserted = cartridgeWidget != null;
    _cartridgeInsertedStreamController.sink.add(_cartridgeInserted);
    _loadedGame = Container();
    _loadedGameStreamController.sink.add(_loadedGame);
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
}
