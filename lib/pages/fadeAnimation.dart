import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnmation extends StatelessWidget {
  final double delay;
  final Widget child;
  FadeAnmation(this.delay,this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track('opacity').add(Duration(milliseconds: 500),
      Tween(begin: 0.0,end: 1.0)),
      Track('tranlateY').add(Duration(milliseconds: 500),
          Tween(begin: 120.0,end: 1.0)),

    ]
    );
    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context,child,animation) => Opacity(
        opacity: animation['opacity']!,
        child: Transform.translate(
            offset: Offset(0,animation['translateY']),
          child: child,
        ),),

    );
  }
}
