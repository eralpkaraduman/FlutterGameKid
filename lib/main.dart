import 'package:flutter/material.dart';
import 'package:flutterKid/home.dart';
import 'package:flutter/services.dart';
import 'package:flutterKid/sfx.dart';

void main() {
  runApp(MyApp());
  Sfx().loadSounds();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter GameKid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
