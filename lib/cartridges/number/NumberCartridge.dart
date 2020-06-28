import 'package:flutter/material.dart';
import 'package:flutterKid/typography/GameTypography.dart';
import 'package:flutterKid/input.dart';

class NumberCartridge extends StatefulWidget {
  @override
  _NumberCartridgeState createState() => _NumberCartridgeState();
}

class _NumberCartridgeState extends State<NumberCartridge> {
  int _counter = 0;

  void initState() {
    Input().getStream(InputKey.A).listen((keyDown) {
      if (keyDown) {
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
