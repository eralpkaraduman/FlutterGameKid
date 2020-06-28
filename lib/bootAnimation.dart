import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'typography/GameTypography.dart';
import 'sfx.dart';

class BootAnimation extends StatefulWidget {
  final VoidCallback onComplete;
  final bool noCartridge;

  BootAnimation({
    @required this.onComplete,
    @required this.noCartridge,
    Key key,
  }) : super(key: key);

  @override
  _BootAnimationState createState() =>
      _BootAnimationState(this.onComplete, this.noCartridge);
}

class _BootAnimationState extends State<BootAnimation> {
  EdgeInsetsGeometry _padding = EdgeInsets.zero;

  final VoidCallback onComplete;
  final bool noCartridge;

  _BootAnimationState(this.onComplete, this.noCartridge);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 400), () {
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
      child: GameTitleText(noCartridge ? '███████©' : 'Flutter©'),
      curve: Curves.linear,
      onEnd: () {
        Sfx().playGameBoyStart();
        Future.delayed(Duration(seconds: 1), () {
          // Play audio
          onComplete();
        });
      },
    );
  }
}
