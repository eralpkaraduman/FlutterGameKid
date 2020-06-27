import 'package:flutter/material.dart';
import 'package:flutterKid/typography/GameTypography.dart';

class NumberCartridge extends StatefulWidget {
  @override
  _NumberCartridgeState createState() => _NumberCartridgeState();
}

class _NumberCartridgeState extends State<NumberCartridge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GameTitleText('Hello'),
      ),
    );
  }
}
