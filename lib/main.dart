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
            Align(
              alignment: Alignment.center,
              child: NeonPanel(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NeonText(
                    color: Colors.white,
                    size: 16,
                    text:
                        "You're about to enter in a future experience... I invite you to left your past reality and enojy the experience...",
                    typingAnimation: true,
                  ),
                ),
                height: 200,
                width: 200,
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
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.topRight,
              child: ClipPath(
                clipper: LeftNeonClipper(),
                child: Container(
                  height: 22,
                  width: 22,
                  color: Color(0XFF22FFFF),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: NeonPanel(
                child: Text(
                    'It’s been over 2077 days since we announced our plan to develop Cyberpunk 2077. We released a CGI trailer, gave some interviews and… went dark. Normal procedure for these kinds of things — you announce a game and then shut up, roll up your sleeves and get to work. We wanted to give you the Witcher 3 and both expansions first, which is why this period of staying silent was longer than we planned. Sorry for that'),
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
