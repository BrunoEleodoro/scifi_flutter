import 'package:flutter/material.dart';

class NeonTile extends StatefulWidget {
  double width;
  Widget child;
  Color backgroundColor;
  NeonTile(
      {this.width, this.child, this.backgroundColor = const Color(0XFF182024)});

  @override
  _NeonTileState createState() => _NeonTileState();
}

class _NeonTileState extends State<NeonTile>
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
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 50,
        width: (startAnimation) ? widget.width : 0,
        decoration: BoxDecoration(color: widget.backgroundColor),
        onEnd: () => setState(() => show = true),
        child: (show) ? widget.child : SizedBox());
  }
}
