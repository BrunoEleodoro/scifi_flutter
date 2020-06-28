import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scifi_flutter/NeonPanel.dart';
import 'package:scifi_flutter/NeonText.dart';
import 'package:scifi_flutter/NeonTile.dart';
import 'package:video_player/video_player.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
    with TickerProviderStateMixin  {
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
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  /*   NeonText(
                        text: 'Welcome ',
                        size: 25,
                        color: Colors.white,
                      ),
                      NeonText(
                        text: 'Bruno',
                        size: 25,
                        color: Color(0xFF22ffff),
                      ),*/
                      SizedBox(
                        width: 250.0,
                        child: TyperAnimatedTextKit(
                          text: [
                            "Welcome Bruno"
                          ],
                          isRepeatingAnimation: false,
                          textStyle: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(-1.5, 1.0),
                                blurRadius: 3.0,
                                color: Colors.white.withAlpha(90),
                              ),
                            ]),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: NeonPanel(
                child: Text('aaa'),
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
