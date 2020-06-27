import 'package:flutter/material.dart';
import 'package:flutterKid/widgets/OpacityButton.dart';
import '../shapes/CirclePainter.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      painter: CirclePainter(44),
      width: 44,
      height: 44,
    );
  }
}
