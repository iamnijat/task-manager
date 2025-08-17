import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CompleteSlider extends StatelessWidget {
  const CompleteSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BounceInLeft(
      duration: const Duration(seconds: 2),
      child: Padding(
        padding: EdgeInsets.only(left: 15.2.w, right: 15.2.w, top: 6.2.h),
        child: SvgPicture.asset(
          "assets/images/completepicture.svg",
          alignment: Alignment.center,
          fit: BoxFit.fitWidth,
          height: 38.2.h,
        ),
      ),
    );
  }
}
