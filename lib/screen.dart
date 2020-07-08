import 'package:flutter/material.dart';
import 'package:flutterKid/system.dart';
import 'package:flutterKid/colors.dart';

class Screen extends StatelessWidget {
  const Screen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AbsorbPointer(
        absorbing: false,
        child: Container(
          color: gameBoyColorLightestGreen,
          child: StreamBuilder<Widget>(
              initialData: Container(),
              stream: System().loadedGameStream,
              builder: (_, snap) {
                return snap.data;
              }),
        ),
      ),
    );
  }
}
