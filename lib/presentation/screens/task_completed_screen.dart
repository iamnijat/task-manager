import 'package:flutter/material.dart';
import '../widgets/completetask/complete_button.dart';
import '../widgets/completetask/complete_slider.dart';
import '../widgets/completetask/complete_subtitle.dart';
import '../widgets/completetask/complete_title.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({Key key}) : super(key: key);

  @override
  _CompletedScreenState createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 191, 166, 1),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            CompleteSlider(),
            CompleteTitle(),
            CompleteSubtitle(),
            CompleteButton()
          ],
        ),
      ),
    );
  }
}
