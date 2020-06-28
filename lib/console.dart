import 'package:flutter/material.dart';
import 'package:flutterKid/input.dart';
import 'package:flutterKid/screen.dart';
import 'package:flutterKid/widgets/CircleButton.dart';
import 'package:flutterKid/widgets/PillButton.dart';
import 'package:flutterKid/typography/GameTypography.dart';

class Console extends StatelessWidget {
  Console({Key key, @required this.active}) : super(key: key);

  final bool active;
  final double _aspectRatio = 914 / 1574;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Center(
          child: AspectRatio(
            aspectRatio: _aspectRatio,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/images/gameboy.png"),
                  fit: BoxFit.contain,
                ),
                SizedBox.expand(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: FractionallySizedBox(
                          heightFactor: 0.13,
                        ),
                      ),
                      Flexible(
                        child: FractionallySizedBox(
                          widthFactor: 0.56,
                          heightFactor: 0.60,
                          child: Screen(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: CircleButton(
                    onKeyDown: () => Input().handleKeyDown(InputKey.A),
                    onKeyUp: () => Input().handleKeyUp(InputKey.A),
                  ),
                  alignment: FractionalOffset(0.93, 0.592),
                ),
                Container(
                  child: CircleButton(
                      onKeyDown: () => Input().handleKeyDown(InputKey.B),
                      onKeyUp: () => Input().handleKeyUp(InputKey.B)),
                  alignment: FractionalOffset(0.738, 0.643),
                ),
                Container(
                  child: PillButton(
                      onKeyDown: () => Input().handleKeyDown(InputKey.Start),
                      onKeyUp: () => Input().handleKeyUp(InputKey.Start)),
                  alignment: FractionalOffset(0.532, 0.781),
                ),
                Positioned(
                  bottom: 10,
                  child: RegularText("Swipe down to change the cartridge"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
