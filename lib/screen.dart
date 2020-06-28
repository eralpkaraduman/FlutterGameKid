import 'package:flutter/material.dart';
import 'package:flutterKid/system.dart';
import 'package:flutterKid/colors.dart';

class Screen extends StatelessWidget {
  const Screen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: gameBoyColorLightestGreen,
        child: StreamBuilder<Widget>(
            stream: System().loadedGameStream,
            builder: (_, snap) {
              return snap.data;
            }),
      ),
    );
  }
}
