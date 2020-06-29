import 'package:flutter/material.dart';
import 'package:scifi_flutter/clippers.dart';

class NeonTarget extends StatefulWidget {
  Widget child;
  double width;
  double height;

  NeonTarget({this.child, this.width, this.height});
  @override
  _NeonTargetState createState() => _NeonTargetState();
}

class _NeonTargetState extends State<NeonTarget> with TickerProviderStateMixin {
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
            Align(
              alignment: Alignment.topCenter,
              child: Transform.rotate(
                angle: 21.99,
                child: LineRow(
                  width: widget.width,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Transform.rotate(
                angle: 0,
                child: LineColumn(
                  height: widget.height,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: widget.child,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Transform.rotate(
                angle: 0,
                child: LineColumn(
                  height: widget.height,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.rotate(
                angle: 21.99,
                child: LineRow(
                  width: widget.width,
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Container(
            //     // width: ,
            //     height: 100,
            //     child: Transform.rotate(
            //       angle: 1.57,
            //       child: Line(),
            //     ),
            //   ),
            // )
          ],
        ));
  }
}

class LineRow extends StatelessWidget {
  double width;
  LineRow({this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(width: 20, height: 10, color: Colors.white),
          Container(width: 10, height: 3, color: Colors.white),
          Container(width: 10, height: 3, color: Colors.white),
          Container(width: 10, height: 3, color: Colors.white),
          Container(width: 10, height: 3, color: Colors.white),
          Container(width: 10, height: 3, color: Colors.white),
          Container(width: 10, height: 3, color: Colors.white),
          Container(width: 8, height: 20, color: Colors.white),
          Container(width: 10, height: 3, color: Colors.white),
          Container(width: 10, height: 3, color: Colors.white),
          Container(width: 10, height: 3, color: Colors.white),
          Container(width: 10, height: 3, color: Colors.white),
          Container(width: 10, height: 3, color: Colors.white),
          Container(width: 10, height: 3, color: Colors.white),
          Container(width: 20, height: 10, color: Colors.white),
        ],
      ),
    );
  }
}

class LineColumn extends StatelessWidget {
  double height;
  LineColumn({this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(width: 20, height: 10, color: Colors.white),
          Container(width: 3, height: 10, color: Colors.white),
          Container(width: 3, height: 10, color: Colors.white),
          Container(width: 3, height: 10, color: Colors.white),
          Container(width: 3, height: 10, color: Colors.white),
          Container(width: 3, height: 10, color: Colors.white),
          Container(width: 3, height: 10, color: Colors.white),
          Container(width: 20, height: 8, color: Colors.white),
          Container(width: 3, height: 10, color: Colors.white),
          Container(width: 3, height: 10, color: Colors.white),
          Container(width: 3, height: 10, color: Colors.white),
          Container(width: 3, height: 10, color: Colors.white),
          Container(width: 3, height: 10, color: Colors.white),
          Container(width: 3, height: 10, color: Colors.white),
          Container(width: 20, height: 10, color: Colors.white),
        ],
      ),
    );
  }
}
