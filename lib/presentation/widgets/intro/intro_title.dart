import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IntroTitle extends StatelessWidget {
  const IntroTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Welcome,",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.2.sp,
              height: 1.8,
              fontWeight: FontWeight.bold,
              fontFamily: "KronaOne",
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
