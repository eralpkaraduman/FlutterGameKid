import 'package:flutter/material.dart';
import 'package:flutterKid/colors.dart';

class GameTitleText extends Text {
  GameTitleText(String data, {Key key})
      : super(
          data,
          key: key,
          style: TextStyle(
            fontFamily: 'Early-GameBoy',
            fontSize: 20,
            color: gameBoyColorDarkGreen,
          ),
        );
}

class GameGiantText extends Text {
  GameGiantText(String data, {Key key})
      : super(
          data,
          key: key,
          style: TextStyle(
              fontFamily: 'Early-GameBoy',
              fontSize: 60,
              color: gameBoyColorDarkestGreen),
        );
}
