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

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>
    with TickerProviderStateMixin {
  bool startAnimation = false;
  AnimationController _animationController;
  VideoPlayerController _controller;
  var weatherData = [
    {
      'weekDay': 'Monday',
      'icon': Icons.wb_cloudy,
      'temp': '8°/13°',
      'wind': '3m/s'
    },
    {
      'weekDay': 'Tuesday',
      'icon': Icons.wb_sunny,
      'temp': '12°/19°',
      'wind': '1m/s'
    },
    {
      'weekDay': 'Wednesday',
      'icon': Icons.brightness_high,
      'temp': '10°/15°',
      'wind': '2m/s'
    },
    {
      'weekDay': 'Thursday',
      'icon': Icons.brightness_low,
      'temp': '7°/13°',
      'wind': '1m/s'
    },
    {
      'weekDay': 'Friday',
      'icon': Icons.wb_sunny,
      'temp': '13°/20°',
      'wind': '5m/s'
    },
  ];
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
          child: Column(
            children: <Widget>[
              NeonTile(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      NeonText(
                        color: Colors.white,
                        size: 25,
                        text: 'WEATHER REPORT - ',
                      ),
                      NeonText(
                        color: Color(0XFF22ffff),
                        size: 25,
                        text: 'ACCURATE STATISTICS',
                      )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height - 200,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: weatherData.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return NeonPanel(
                      height: MediaQuery.of(context).size.height - 200,
                      width: 250,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Icon(
                              weatherData[index]['icon'],
                              color: Colors.white,
                              size: 100,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            NeonText(
                              typingAnimation: false,
                              color: Color(0XFFf6fd96),
                              size: 25,
                              text: weatherData[index]['temp'],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.toys),
                                SizedBox(
                                  width: 20,
                                ),
                                NeonText(
                                  typingAnimation: false,
                                  color: Color(0XFFcbdedf),
                                  size: 25,
                                  text: weatherData[index]['wind'],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            NeonButton(
                              color: Color(0XFF22ffff),
                              height: 40,
                              text: 'DETAILS',
                              onPressed: () {},
                              width: 150,
                            )
                          ],
                        ),
                      ),
                      neonTile: NeonTile(
                          backgroundColor: Color(0XFF22ffff),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: NeonText(
                              typingAnimation: false,
                              color: Colors.black,
                              size: 25,
                              text: weatherData[index]['weekDay'],
                            ),
                          )),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
