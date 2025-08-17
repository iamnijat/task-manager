import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CompleteSubtitle extends StatelessWidget {
  const CompleteSubtitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 15.2.w, top: 2.2.h),
          child: Text(
            "Your tasks for today\nare finished!",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.2.sp,
                height: 2.1,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
                letterSpacing: 1.3),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
