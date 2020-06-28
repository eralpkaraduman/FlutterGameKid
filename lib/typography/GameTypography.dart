import 'package:flutter/material.dart';

class GameTitleText extends Text {
  GameTitleText(String data, {Key key})
      : super(
          data,
          key: key,
          style: TextStyle(fontFamily: 'Early-GameBoy', fontSize: 20),
        );
}

class GameGiantText extends Text {
  GameGiantText(String data, {Key key})
      : super(
          data,
          key: key,
          style: TextStyle(fontFamily: 'Early-GameBoy', fontSize: 60),
        );
}
