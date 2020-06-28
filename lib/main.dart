import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.orbitron().fontFamily,
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool startAnimation = false;
  AnimationController _animationController;
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.repeat();

    Future.delayed(Duration(seconds: 1), () {
      // final assetsAudioPlayer = AssetsAudioPlayer();

      // assetsAudioPlayer.open(
      //   Audio("assets/audios/song1.mp3"),
      // );
      _controller = VideoPlayerController.asset('assets/audios/menu_sound.mp3');
      _controller.initialize();
      _controller.play();
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: (startAnimation) ? MediaQuery.of(context).size.width : 0,
              height: 50,
              decoration: BoxDecoration(color: Color(0XFF182024), boxShadow: [
                BoxShadow(
                  color: Color(0xFF000000).withAlpha(60),
                  blurRadius: 6.0,
                  spreadRadius: 0.0,
                  offset: Offset(
                    0.0,
                    3.0,
                  ),
                ),
              ]
                  // shape: BoxShape.circle,
                  // border: Border.all(color: Colors.cyanAccent)
                  ),
              child: Center(
                child: FadeTransition(
                    opacity: _animationController,
                    child:
                        Text('Welcome Bruno!', style: TextStyle(fontSize: 25))),
              ),
            )
            // ClipPath(
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     height: 200,
            //     color: Colors.blue,
            //   ),
            //   clipper: CustomClipPath(),
            // ),
            // ClipPath(
            //   child: Container(
            //     margin: EdgeInsets.only(left: 10, right: 10),
            //     width: MediaQuery.of(context).size.width,
            //     height: 180,
            //     color: Colors.black,
            //   ),
            //   clipper: CustomClipPath(),
            // ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(0, size.height * 0.8);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
