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

    Future.delayed(Duration(seconds: 1), () async {
      setState(() {
        startAnimation = true;
      });

      _controller = VideoPlayerController.asset('assets/audios/menu_sound.mp3');
      await _controller.initialize();
      _controller.play();
    });

    Future.delayed(Duration(seconds: 2), () {
      _controller.pause();
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
              ]),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(-1.5, 1.0),
                                blurRadius: 3.0,
                                color: Colors.white.withAlpha(90),
                              ),
                            ])),
                    Text('Bruno!',
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF22ffff),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
