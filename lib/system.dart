import 'package:flutter/material.dart';

class System {
  static final System _singleton = System._internal();

  Widget _loadedGame;
  get loadedGame => _loadedGame;

  factory System() {
    return _singleton;
  }

  void _unloadCartridge() {}

  void loadCartridge(Widget cartridgeWidget) {
    _unloadCartridge();
    _loadedGame = cartridgeWidget;
  }

  System._internal();
}
