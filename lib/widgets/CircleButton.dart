import 'package:flutter/material.dart';
import 'package:flutterKid/widgets/OpacityButton.dart';
import '../shapes/CirclePainter.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({Key key, @required this.onTap}) : super(key: key);
  final void Function() onTap;
  final double size = 50;
  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      painter: CirclePainter(size),
      width: size,
      height: size,
      onTap: onTap,
    );
  }
}
