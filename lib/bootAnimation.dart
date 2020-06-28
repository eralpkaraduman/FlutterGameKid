import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'typography/GameTypography.dart';

class BootAnimation extends StatefulWidget {
  final VoidCallback onComplete;

  BootAnimation({this.onComplete, Key key}) : super(key: key);

  @override
  _BootAnimationState createState() => _BootAnimationState(this.onComplete);
}

class _BootAnimationState extends State<BootAnimation> {
  EdgeInsetsGeometry _padding = EdgeInsets.zero;

  final VoidCallback onComplete;

  _BootAnimationState(this.onComplete);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _padding = EdgeInsets.fromLTRB(0, 95, 0, 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: Duration(seconds: 3),
      padding: _padding,
      child: GameTitleText('Flutter©'),
      curve: Curves.linear,
      onEnd: () {
        print("animation ended");
        Future.delayed(Duration(seconds: 1), () {
          // Play audio
          onComplete();
        });
      },
    );
  }
}
