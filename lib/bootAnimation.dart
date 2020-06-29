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
  double _padding = 0;

  final VoidCallback onComplete;
  final bool noCartridge;

  _BootAnimationState(this.onComplete, this.noCartridge);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        _padding = 95;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        AnimatedPositioned(
          top: _padding,
          duration: Duration(seconds: 4),
          curve: Curves.linear,
          child: GameTitleText(noCartridge ? '███████©' : 'Flutter©'),
          onEnd: () {
            Sfx().playGameBoyStart();
            Future.delayed(Duration(seconds: 2), () => onComplete());
          },
        ),
      ],
    );
  }
}
