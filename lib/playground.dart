import 'package:flutter/material.dart';
import 'package:scifi_flutter/BorderNeonPanel.dart';
import 'package:scifi_flutter/NeonPanel.dart';
import 'package:scifi_flutter/NeonText.dart';
import 'package:scifi_flutter/NeonTile.dart';
import 'package:video_player/video_player.dart';

class PlaygroundScreen extends StatefulWidget {
  @override
  _PlaygroundScreenState createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen>
    with TickerProviderStateMixin {
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
            Container(
              height: 500,
              child: Align(
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
                          color: Color(0XFFe6cb00).withOpacity(0.8),
                          size: 25,
                          text: '2077',
                        )
                      ],
                    )),
              ),
            ),

            /* Align(
              alignment: Alignment.centerRight,
              child: BorderNeonPanel(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://i.pinimg.com/originals/9e/c2/81/9ec2814f132e9200c8642ecaab7e2317.gif',
                          )),
                      height: 305,
                      width: 300,
                      neonTile: NeonTile(
                        width: 300,
                        backgroundColor: Color(0XFFe6cb00).withOpacity(0.8),
                        child: Center(
                          child: NeonText(
                            text: 'Hologram',
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
            ),*/

            Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    BorderNeonPanel(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://66.media.tumblr.com/c24367d7934ae22c352ac4e639aea456/tumblr_pqucgdhVaf1ujqvcvo1_400.gifv',
                          )),
                      height: 360,
                      width: 300,
                      neonTile: NeonTile(
                        width: 300,
                        backgroundColor: Color(0XFFe6cb00).withOpacity(0.8),
                        child: Center(
                          child: NeonText(
                            text: 'Hologram',
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    NeonPanel(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            NeonText(
                              color: Colors.white,
                              size: 16,
                              text:
                                  "At a university library, I opened the drawer to a card catalog that isn’t being used anymore. I just decided to open one up, and there was this piece of paper inside that read: ‘If you are reading this, it is proof time travel exists. 4/4/2085.’ It’s a letter from April 4, 2085. This feels like the beginning of a movie",
                              typingAnimation: true,
                            ),
                          ],
                        ),
                      ),
                      height: 300,
                      width: 300,
                      neonTile: NeonTile(
                        width: 300,
                        backgroundColor: Color(0XFFe6cb00).withOpacity(0.8),
                        child: Center(
                          child: NeonText(
                            text: 'Information',
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    BorderNeonPanel(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://i.pinimg.com/originals/9e/c2/81/9ec2814f132e9200c8642ecaab7e2317.gif',
                          )),
                      height: 305,
                      width: 300,
                      neonTile: NeonTile(
                        width: 300,
                        backgroundColor: Color(0XFFe6cb00).withOpacity(0.8),
                        child: Center(
                          child: NeonText(
                            text: 'Hologram',
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BorderNeonPanel(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://thumbs.gfycat.com/MetallicNegativeBobolink-max-1mb.gif',
                          )),
                      height: 240,
                      width: 300,
                      neonTile: NeonTile(
                        width: 300,
                        backgroundColor: Color(0XFFe6cb00).withOpacity(0.8),
                        child: Center(
                          child: NeonText(
                            text: 'Hologram',
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
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
