import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class NeonText extends StatelessWidget {
  NeonText({this.text, this.color, this.size, this.typingAnimation = false});
  String text = "";
  Color color;
  double size;
  bool typingAnimation;
  @override
  Widget build(BuildContext context) {
    if (typingAnimation) {
      return TyperAnimatedTextKit(
          speed: Duration(milliseconds: 40),
          text: [text],
          isRepeatingAnimation: false,
          textStyle: TextStyle(fontSize: size, color: color, shadows: <Shadow>[
            Shadow(
              offset: Offset(-1.5, 1.0),
              blurRadius: 3.0,
              color: color.withAlpha(90),
            ),
          ]),
          textAlign: TextAlign.start,
          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
          );
    }
    return Text(text,
        style: TextStyle(fontSize: size, color: color, shadows: <Shadow>[
          Shadow(
            offset: Offset(-1.5, 1.0),
            blurRadius: 3.0,
            color: color.withAlpha(90),
          ),
        ]));
  }
}
