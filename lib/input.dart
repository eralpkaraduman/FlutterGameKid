import 'dart:async';

enum InputKey {
  A,
  B,
  Start,
}

class Input {
  static final Input _singleton = Input._internal();

  // ignore: close_sinks
  StreamController<bool> _keyAStreamController = StreamController<bool>();
  // ignore: close_sinks
  StreamController<bool> _keyBStreamController = StreamController<bool>();
  // ignore: close_sinks
  StreamController<bool> _keyStartStreamController = StreamController<bool>();
  Stream<bool> get _keyAStream => _keyAStreamController.stream;
  Stream<bool> get _keyBStream => _keyBStreamController.stream;
  Stream<bool> get _keyStartStream => _keyStartStreamController.stream;

  factory Input() {
    return _singleton;
  }

  Stream<bool> getStream(InputKey key) {
    switch (key) {
      case InputKey.A:
        return _keyAStream;
      case InputKey.B:
        return _keyBStream;
      case InputKey.Start:
        return _keyStartStream;
    }
    return null;
  }

  StreamController<bool> _getStreamController(InputKey key) {
    switch (key) {
      case InputKey.A:
        return _keyAStreamController;
      case InputKey.B:
        return _keyBStreamController;
      case InputKey.Start:
        return _keyStartStreamController;
    }
    return null;
  }

  void handleKeyDown(InputKey key) => _getStreamController(key).sink.add(true);
  void handleKeyUp(InputKey key) => _getStreamController(key).sink.add(false);

  Input._internal();
}
