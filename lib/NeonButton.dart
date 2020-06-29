import 'package:flutter/material.dart';
import 'package:scifi_flutter/NeonText.dart';

import 'clippers.dart';

class NeonButton extends StatefulWidget {
  double width;
  double height;
  Color color;
  String text;
  var onPressed;

  NeonButton({this.text, this.width, this.height, this.color, this.onPressed});

  @override
  _NeonButtonState createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton>
    with SingleTickerProviderStateMixin {
  bool startAnimation = false;
  AnimationController _animationController;
  bool show = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: <Widget>[
            Container(
              width: widget.width,
              height: widget.height,
              color: widget.color,
            ),
            Center(
              child: NeonText(
                color: Colors.black,
                text: widget.text,
                size: 18,
                typingAnimation: false,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipPath(
                  clipper: RightNeonClipper(),
                  child: Container(
                    height: 22,
                    width: 22,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Transform.rotate(
                angle: 21.99,
                child: ClipPath(
                  clipper: RightNeonClipper(),
                  child: Container(
                    height: 22,
                    width: 22,
                    color: Color(0XFF182024),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Transform.rotate(
                angle: 21.99,
                child: ClipPath(
                  clipper: RightNeonClipper(),
                  child: Container(
                    height: 15,
                    width: 15,
                    color: widget.color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ClipPath(
//                 clipper: RightNeonClipper(),
//                 child: Container(
//                   height: 22,
//                   width: 22,
//                   color: Color(0XFF22FFFF),
//                 ),
//               ),
