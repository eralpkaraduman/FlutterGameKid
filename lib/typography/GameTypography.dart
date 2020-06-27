import 'package:flutter/material.dart';

final TextStyle _gameTitleTextStyle =
    TextStyle(fontFamily: 'Early-GameBoy', fontSize: 24);

class GameTitleText extends Text {
  GameTitleText(String data, {Key key})
      : super(
          data,
          key: key,
          style: _gameTitleTextStyle,
        );
}
