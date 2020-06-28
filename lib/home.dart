import 'package:flutter/material.dart';
import 'console.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double swipeSenstivity = 40;
  bool _showConsole = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          print(details.delta.dy);
          if (details.delta.dy > swipeSenstivity) {
            this.setState(() => _showConsole = false);
          } else if (details.delta.dy < -swipeSenstivity) {
            this.setState(() => _showConsole = true);
          }
        },
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              color: Colors.red,
            ),
            AnimatedPositioned(
              top: _showConsole ? 0 : (size.height * 0.60),
              height: size.height,
              width: size.width,
              duration: Duration(milliseconds: 650),
              curve: Curves.bounceOut,
              child: Console(),
            ),
          ],
        ),
      ),
    );
  }
}
