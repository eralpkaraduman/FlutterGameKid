import 'package:flutter/material.dart';
import 'package:flutterKid/system.dart';

class Screen extends StatelessWidget {
  const Screen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.green,
        child: System().loadedGame,
      ),
    );
  }
}
