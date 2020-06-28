import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scifi_flutter/NeonPanel.dart';
import 'package:scifi_flutter/NeonText.dart';
import 'package:scifi_flutter/NeonTile.dart';
import 'package:video_player/video_player.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: NeonTile(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      NeonText(
                        color: Colors.white,
                        size: 25,
                        text: 'Welcome To ',
                      ),
                      NeonText(
                        color: Color(0xFF22ffff),
                        size: 25,
                        text: '2077',
                      )
                    ],
                  )),
            ),
            // Align(
            //   alignment: Alignment.topRight,
            //   child:
            // ),
            Align(
              alignment: Alignment.center,
              child: NeonPanel(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NeonText(
                    color: Colors.white,
                    size: 16,
                    text:
                        "At a university library, I opened the drawer to a card catalog that isn’t being used anymore. I just decided to open one up, and there was this piece of paper inside that read: ‘If you are reading this, it is proof time travel exists. 4/4/2085.’ It’s a letter from April 4, 2085. This feels like the beginning of a movie",
                    typingAnimation: true,
                  ),
                ),
                height: 500,
                width: 300,
                neonTile: NeonTile(
                  width: 300,
                  backgroundColor: Color(0xFF22ffff),
                  child: Center(
                    child: NeonText(
                      text: 'Information',
                      size: 25,
                      color: Colors.black,
                    ),
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
