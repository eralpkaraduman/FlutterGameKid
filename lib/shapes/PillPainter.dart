// Based on: https://fluttercentral.com/Articles/Post/1079/How_to_Draw_a_Solid_Circle_using_Canvas_in_Flutter

import 'package:flutter/material.dart';
import 'dart:math';

class PillPainter extends CustomPainter {
  Paint _paint;

  double pillHeight = 20;
  double width, height;

  final double canvasRotationDeg = -25 * (pi / 180.0);

  PillPainter({@required this.width, @required this.height}) {
    _paint = Paint()
      ..color = Color.fromARGB(150, 0, 0, 0)
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.rotate(canvasRotationDeg);
    canvas.translate(-13, height / 2);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, width, pillHeight),
          Radius.circular(pillHeight / 2),
        ),
        _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
