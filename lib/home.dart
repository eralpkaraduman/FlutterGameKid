import 'package:flutter/material.dart';
import 'package:flutterKid/typography/GameTypography.dart';
import 'console.dart';
import 'colors.dart';
import 'system.dart';
import 'CartridgeSelectScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double swipeSenstivity = 30;
  bool _showConsole = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > swipeSenstivity) {
            this.setState(() => _showConsole = false);
          } else if (details.delta.dy < -swipeSenstivity) {
            this.setState(() => _showConsole = true);
          }
        },
        child: Container(
          color: Colors.blueGrey,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              AnimatedOpacity(
                opacity: _showConsole ? 1 : 0,
                duration: Duration(milliseconds: 450),
                child: AbsorbPointer(
                  absorbing: false,
                  child: Container(color: gameBoyColorBeige),
                ),
              ),
              AnimatedOpacity(
                opacity: _showConsole ? 0 : 1,
                duration: Duration(milliseconds: 450),
                child: CartridgeSelectScreen(),
              ),
              Positioned(
                top: size.height * 0.47,
                child: AnimatedOpacity(
                  opacity: _showConsole ? 0 : 1,
                  duration: Duration(milliseconds: 450),
                  child: StreamBuilder<bool>(
                    stream: System().cartridgeInsertedStream,
                    builder: (_, snap) {
                      return RegularText(
                        'Swipe up to play. Tap cartridge to ${snap.data ? 'eject' : 'insert'}',
                      );
                    },
                  ),
                ),
              ),
              AnimatedPositioned(
                top: _showConsole ? 0 : (size.height * 0.50),
                height: size.height,
                width: size.width,
                duration: Duration(milliseconds: 450),
                curve: Curves.bounceOut,
                child: Console(active: _showConsole),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
