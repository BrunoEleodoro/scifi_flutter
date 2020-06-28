import 'package:flutter/material.dart';

class RightNeonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Arranca desde la punta topLeft
    Path path = Path();
    // Le digo que vaya a bottomCenter
    path.lineTo(size.width, size.height);
    // Le digo que vaya a topRight
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}

class LeftNeonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Arranca desde la punta topLeft
    Path path = Path();
    // Le digo que vaya a bottomCenter
    path.lineTo(0.0, size.height);
    // Le digo que vaya a topRight
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}

class BottomNeonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Arranca desde la punta topLeft
    Path path = Path();
    // Le digo que vaya a bottomCenter
    path.lineTo(0.0, size.height);
    // Le digo que vaya a topRight
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
