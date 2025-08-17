import 'package:flutter/material.dart';
import '../widgets/completetask/complete_button.dart';
import '../widgets/completetask/complete_slider.dart';
import '../widgets/completetask/complete_subtitle.dart';
import '../widgets/completetask/complete_title.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CompletedScreenState createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(0, 191, 166, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
