import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutterKid/sfx.dart';

// Based on: https://stackoverflow.com/a/54474645/2172057
class OpacityButton extends StatefulWidget {
  final CustomPainter painter;
  final double width, height;
  final void Function() onKeyDown, onKeyUp;
  @override
  _OpacityButtonState createState() => _OpacityButtonState(
        painter,
        width,
        height,
        onKeyDown,
        onKeyUp,
      );
  const OpacityButton(
      {Key key,
      @required this.onKeyUp,
      @required this.onKeyDown,
      @required this.painter,
      @required this.width,
      @required this.height})
      : super(key: key);
}

class _OpacityButtonState extends State<OpacityButton> {
  bool isTappedDown = false;
  final CustomPainter painter;
  final double width, height;
  final void Function() onKeyDown, onKeyUp;
  _OpacityButtonState(
    this.painter,
    this.width,
    this.height,
    this.onKeyDown,
    this.onKeyUp,
  );

  void playKeyPressSound() {
    double rand = new Random().nextDouble() * 10;
    if (rand.round() % 2 == 0) {
      Sfx().playButton1();
    } else {
      Sfx().playButton2();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: isTappedDown ? 1 : 0,
      // opacity: isTappedDown ? 0 : 1,
      child: GestureDetector(
        child: Container(
          width: this.width,
          height: this.height,
          child: CustomPaint(painter: this.painter),
          // color: Colors.red,
        ),
        onTapDown: (_) {
          playKeyPressSound();
          onKeyDown();
          setState(() {
            isTappedDown = true;
          });
        },
        onTapUp: (_) {
          onKeyUp();
          setState(() {
            isTappedDown = false;
          });
        },
        onTapCancel: () {
          setState(() {
            isTappedDown = false;
          });
        },
        onTap: () {},
      ),
    );
  }
}
