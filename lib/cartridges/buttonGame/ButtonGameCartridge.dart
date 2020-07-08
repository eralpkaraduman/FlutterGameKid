import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterKid/sfx.dart';
import 'package:flutterKid/typography/GameTypography.dart';
import 'package:flutterKid/input.dart';

class ButtonGameCartridge extends StatefulWidget {
  @override
  _ButtonGameCartridgeState createState() => _ButtonGameCartridgeState();
}

class _ButtonGameCartridgeState extends State<ButtonGameCartridge> {
  int _counter = 0;
  bool _gameStarted = false;
  StreamSubscription _aKeySub;
  StreamSubscription _startKeySub;

  void initState() {
    _aKeySub = Input().getStream(InputKey.A).listen((keyDown) {
      if (_gameStarted && keyDown) {
        Sfx().playBlip();
        setState(() => _counter++);
      }
    });
    _startKeySub = Input().getStream(InputKey.Start).listen((keyDown) {
      if (!_gameStarted && keyDown) {
        Sfx().playStart();
        Future.delayed(Duration(seconds: 1), () {
          setState(() => _gameStarted = true);
        });
      }
    });
    super.initState();
  }

  @override
  deactivate() {
    _aKeySub.cancel();
    _startKeySub.cancel();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            if (!_gameStarted) ...[
              GameTitleText('Button Game'),
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  heightFactor: 0.9,
                  child: Image(
                    image: AssetImage("assets/images/button-game.png"),
                  ),
                ),
              ),
              GameTitleText('Press Start'),
            ] else ...[
              GameTitleText('Press "A" to make the number go up'),
              GameGiantText('$_counter'),
            ]
          ],
        ),
      )),
    );
  }
}
