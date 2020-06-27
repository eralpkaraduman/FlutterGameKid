import 'package:flutter/material.dart';
import 'package:flutterKid/screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _aspectRatio = 914 / 1574;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 173, 167, 153),
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
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
