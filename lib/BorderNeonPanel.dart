import 'package:flutter/material.dart';
import 'package:scifi_flutter/clippers.dart';

class BorderNeonPanel extends StatefulWidget {
  Widget neonTile;
  Widget child;
  double width;
  double height;

  BorderNeonPanel({this.neonTile, this.child, this.width, this.height});
  @override
  _BorderNeonPanelState createState() => _BorderNeonPanelState();
}

class _BorderNeonPanelState extends State<BorderNeonPanel> with TickerProviderStateMixin {
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
        end = true;
        showWidth = true;
      });
      await Future.delayed(Duration(milliseconds: 300));
      setState(() {
        showHeight = true;
      });
      await Future.delayed(Duration(milliseconds: 500));
      setState(() {});
    });
  }

// #edf195
//  setState(() {
//         startAnimationHeight = false;
//       });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: <Widget>[
          Container(child: widget.neonTile),
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
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
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
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: (showWidth) ? widget.width : 0,
                height: (showHeight) ? widget.height : 0,
                // height: 400,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0XFFe6cb00).withOpacity(0.8)
                  )
                ),
                curve: Curves.easeIn,
                child: (end)
                    ? Column(
                        children: <Widget>[widget.child],
                      )
                    : SizedBox()),
          ),
        ],
      ),
    );
  }
}
