import 'package:flutter/material.dart';
import 'package:flutterKid/widgets/OpacityButton.dart';
import '../shapes/PillPainter.dart';

class PillButton extends StatelessWidget {
  const PillButton({
    Key key,
    @required this.onKeyDown,
    @required this.onKeyUp,
  }) : super(key: key);
  final void Function() onKeyDown, onKeyUp;
  final double width = 62;
  final double height = 52;
  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      painter: PillPainter(
        width: width,
        height: height,
      ),
      width: width,
      height: height,
      onKeyDown: onKeyDown,
      onKeyUp: onKeyUp,
    );
  }
}
