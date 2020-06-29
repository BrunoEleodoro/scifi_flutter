import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scifi_flutter/NeonButton.dart';
import 'package:scifi_flutter/NeonPanel.dart';
import 'package:scifi_flutter/NeonTarget.dart';
import 'package:scifi_flutter/NeonText.dart';
import 'package:scifi_flutter/NeonTile.dart';
import 'package:video_player/video_player.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                NeonTile(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: NeonText(
                    color: Colors.black,
                    size: 25,
                    text: 'Developers',
                    typingAnimation: true,
                  )),
                  backgroundColor: Color(0XFF22ffff),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.network(
                  'https://avatars2.githubusercontent.com/u/20596317?s=460&u=036a68829e94f9ab8e039fa3a57ea134587470a4&v=4',
                  width: 200,
                ),
                NeonTile(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: NeonText(
                    color: Colors.white,
                    size: 25,
                    text: 'Bruno Eleodoro Roza',
                    typingAnimation: true,
                  )),
                ),
                NeonTile(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: NeonText(
                    color: Colors.white,
                    size: 25,
                    text: 'github.com/BrunoEleodoro',
                    typingAnimation: true,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.network(
                  'https://avatars1.githubusercontent.com/u/20642700?s=460&u=bee0e89855357242003a2736a9238fc1827d4dff&v=4',
                  width: 200,
                ),
                NeonTile(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: NeonText(
                    color: Colors.white,
                    size: 25,
                    text: 'Victor Gabriel',
                    typingAnimation: true,
                  )),
                ),
                NeonTile(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: NeonText(
                    color: Colors.white,
                    size: 25,
                    text: 'github.com/victorbilisambipar',
                    typingAnimation: true,
                  )),
                ),
              ],
            ),
          )),
    );
  }
}
