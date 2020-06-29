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

  Animation<int> _characterCount;

  int _stringIndex;
  static const List<String> _kStrings = const <String>['Welcome Bruno'];
  String get _currentString => _kStrings[_stringIndex % _kStrings.length];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () async {
      AnimationController controller = new AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this,
      );
      setState(() {
        _stringIndex = _stringIndex == null ? 0 : _stringIndex + 1;
        _characterCount = new StepTween(begin: 0, end: _currentString.length)
            .animate(
                new CurvedAnimation(parent: controller, curve: Curves.easeIn));
      });
      await controller.forward();
      controller.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle textStyle = theme.textTheme.title.copyWith(
      fontFamily: 'Courier New',
      color: const Color.fromARGB(255, 0, 199, 0),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.navigate_next),
        onPressed: () async {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            /*  AnimatedContainer(
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
              ]),*/
            //child:
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: new EdgeInsets.symmetric(
                        vertical: 50.0, horizontal: 10.0),
                    child: _characterCount == null
                        ? null
                        : new AnimatedBuilder(
                            animation: _characterCount,
                            builder: (BuildContext context, Widget child) {
                              String text = _currentString.substring(
                                  0, _characterCount.value);
                              return new Text(text,
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(-1.5, 1.0),
                                          blurRadius: 3.0,
                                          color: Colors.white.withAlpha(90),
                                        ),
                                      ]));
                            },
                          ),
                  ),
                ],
              ),
            ),
            //),
          ],
        ),
      ),
    );
  }
}
