import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class IntroSlider extends StatelessWidget {
  const IntroSlider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(seconds: 2),
      child: Padding(
        padding: EdgeInsets.only(left: 14.2.w, right: 14.2.w, top: 8.2.h),
        child: Center(
          child: SvgPicture.asset(
            "assets/images/intropicture.svg",
            alignment: Alignment.center,
            fit: BoxFit.fitWidth,
            height: 32.6.h,
          ),
        ),
      ),
    );
  }
}
