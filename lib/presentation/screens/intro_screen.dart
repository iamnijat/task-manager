import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/intro/float_button.dart';
import '../widgets/intro/intro_slider.dart';
import '../widgets/intro/intro_subtitle.dart';
import '../widgets/intro/intro_title.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(185, 147, 214, 1),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const IntroSlider(),
            SizedBox(
              height: 3.5.h,
            ),
            const IntroTitle(),
            SizedBox(
              height: 5.5.h,
            ),
            const IntroSubtitle(),
            SizedBox(
              height: 7.5.h,
            ),
          ],
        ),
      ),
      floatingActionButton: SlideInLeft(
          duration: const Duration(seconds: 2), child: const FloatButton()),
    );
  }
}
