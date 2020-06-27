import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutterKid/sfx.dart';

// Based on: https://stackoverflow.com/a/54474645/2172057
class OpacityButton extends StatefulWidget {
  final CustomPainter painter;
  final double width, height;
  @override
  _OpacityButtonState createState() =>
      _OpacityButtonState(painter, width, height);
  const OpacityButton(
      {Key key,
      @required this.painter,
      @required this.width,
      @required this.height})
      : super(key: key);
}

class _OpacityButtonState extends State<OpacityButton> {
  bool isTappedDown = false;
  final CustomPainter painter;
  final double width, height;
  _OpacityButtonState(this.painter, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      // opacity: isTappedDown ? 1 : 0,
      opacity: isTappedDown ? 0 : 1,
      child: GestureDetector(
        child: Container(
          color: Colors.black,
          width: this.width,
          height: this.height,
          child: CustomPaint(painter: this.painter),
        ),
        onTapDown: (_) {
          setState(() {
            isTappedDown = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            isTappedDown = false;
          });
        },
        onTapCancel: () {
          setState(() {
            isTappedDown = false;
          });
        },
        onTap: () {
          double rand = new Random().nextDouble() * 10;
          print(rand);
          if (rand.round() % 2 == 0) {
            Sfx().playButton1();
          } else {
            Sfx().playButton2();
          }
        },
      ),
    );
  }
}
