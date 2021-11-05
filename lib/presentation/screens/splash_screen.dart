import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'intro_screen.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key key}) : super(key: key);

  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      useLoader: false,
      navigateAfterSeconds: const IntroScreen(),
      image: Image.asset(
        'assets/images/task.png',
        alignment: Alignment.center,
      ),
      backgroundColor: const Color.fromRGBO(185, 147, 214, 1),
      photoSize: 70.0,
    );
  }
}
