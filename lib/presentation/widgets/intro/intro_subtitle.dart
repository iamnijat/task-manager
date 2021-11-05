import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IntroSubtitle extends StatelessWidget {
  const IntroSubtitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BounceInUp(
       duration: const Duration(seconds: 3),
      child: Padding(
         padding: EdgeInsets.only(left: 15.w,right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "This app allows you to learn time management and organize your works perfectly",
              style: TextStyle(
                color: Colors.white,
                 fontSize: 14.5.sp,
      
                  fontFamily: "KronaOne",
              ),
    
            ),
          ],
        ),
      ),
    );
  }
}
