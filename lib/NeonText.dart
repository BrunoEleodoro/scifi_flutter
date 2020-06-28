import 'package:flutter/material.dart';

class NeonText extends StatelessWidget {
  NeonText({this.text, this.color, this.size});
  String text = "";
  Color color;
  double size;
  @override
  Widget build(BuildContext context) {
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
