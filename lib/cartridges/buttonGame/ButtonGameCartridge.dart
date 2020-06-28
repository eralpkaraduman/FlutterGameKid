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

  void initState() {
    Input().getStream(InputKey.A).listen((keyDown) {
      if (keyDown) {
        Sfx().playBlip();
        setState(() => _counter++);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            GameTitleText('Press "A" to make the number go up'),
            GameGiantText('$_counter'),
          ],
        ),
      )),
    );
  }
}
