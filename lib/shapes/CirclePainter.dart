// Based on: https://fluttercentral.com/Articles/Post/1079/How_to_Draw_a_Solid_Circle_using_Canvas_in_Flutter

import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  Paint _paint;
  double width;

  CirclePainter(this.width) {
    _paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(width / 2, width / 2), width / 2, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
