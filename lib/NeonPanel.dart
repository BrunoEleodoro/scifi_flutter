import 'package:flutter/material.dart';

class NeonPanel extends StatefulWidget {
  Widget neonTile;
  Widget child;
  double width;
  double height;

  NeonPanel({this.neonTile, this.child, this.width, this.height});
  @override
  _NeonPanelState createState() => _NeonPanelState();
}

class _NeonPanelState extends State<NeonPanel> with TickerProviderStateMixin {
  Animation<double> _animationWidth;
  AnimationController _animationControllerWidth;

  Animation<double> _animationHeight;
  AnimationController _animationControllerHeight;
  bool showWidth = false;
  bool showHeight = false;
  bool end = false;
  @override
  void initState() {
    super.initState();
    // _animationControllerWidth =
    //     AnimationController(vsync: this, duration: Duration(seconds: 2));
    // _animationWidth = Tween<double>(begin: 0, end: widget.width).animate(
    //     CurvedAnimation(
    //         parent: _animationControllerWidth, curve: Curves.fastOutSlowIn));

    // _animationControllerHeight =
    //     AnimationController(vsync: this, duration: Duration(seconds: 2));
    // _animationHeight = Tween<double>(begin: 0, end: widget.height).animate(
    //     CurvedAnimation(
    //         parent: _animationControllerHeight, curve: Curves.fastOutSlowIn));

    Future.delayed(Duration(milliseconds: 200), () async {
      // print('start');
      // _animationControllerWidth.forward();
      // await Future.delayed(Duration(seconds: 1));
      // print('start2');
      // _animationControllerHeight.forward();
      setState(() {
        showWidth = true;
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        showHeight = true;
      });
    });
  }

//  setState(() {
//         startAnimationHeight = false;
//       });
  @override
  Widget build(BuildContext context) {
    print(widget.height);
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: (showWidth) ? widget.width : 0,
        height: (showHeight) ? widget.height : 0,
        // height: 400,
        decoration: BoxDecoration(
          color: Color(0XFF182024),
        ),
        onEnd: () => setState(() => end = true),
        curve: Curves.easeIn,
        child: (end)
            ? Column(
                children: <Widget>[
                  widget.neonTile,
                  SizedBox(
                    height: 20,
                  ),
                  widget.child
                ],
              )
            : SizedBox());
  }
}
