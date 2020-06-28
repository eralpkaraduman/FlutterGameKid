import 'package:flutter/material.dart';
import 'package:flutterKid/widgets/OpacityButton.dart';
import '../shapes/CirclePainter.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key key,
    @required this.onKeyDown,
    @required this.onKeyUp,
  }) : super(key: key);
  final void Function() onKeyDown, onKeyUp;
  final double size = 50;
  @override
  Widget build(BuildContext context) {
    return OpacityButton(
        painter: CirclePainter(size),
        width: size,
        height: size,
        onKeyDown: onKeyDown,
        onKeyUp: onKeyUp);
  }
}
