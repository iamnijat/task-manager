import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CompleteTitle extends StatelessWidget {
  const CompleteTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 15.2.w, top: 8.2.h),
          child: DefaultTextStyle(
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: 23.2.sp,
              height: 1.8,
              fontWeight: FontWeight.bold,
              fontFamily: "KronaOne",
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText("Great job!"),
              ],
              isRepeatingAnimation: false,
            ),
          ),
        ),
      ],
    );
  }
}
