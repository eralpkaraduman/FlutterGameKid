import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutterKid/sfx.dart';

// Based on: https://stackoverflow.com/a/54474645/2172057
class OpacityButton extends StatefulWidget {
  final CustomPainter painter;
  final double width, height;
  final void Function() onTap;
  @override
  _OpacityButtonState createState() =>
      _OpacityButtonState(painter, width, height, onTap);
  const OpacityButton(
      {Key key,
      @required this.onTap,
      @required this.painter,
      @required this.width,
      @required this.height})
      : super(key: key);
}

class _OpacityButtonState extends State<OpacityButton> {
  bool isTappedDown = false;
  final CustomPainter painter;
  final double width, height;
  final void Function() onTap;
  _OpacityButtonState(this.painter, this.width, this.height, this.onTap);

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
          this.onTap();
          double rand = new Random().nextDouble() * 10;
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
