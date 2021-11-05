import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 3.5.h),
          child: SizedBox(
            height: 30.h,
            child: SvgPicture.asset(
              "assets/images/null.svg",
              alignment: Alignment.center,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
         ElasticIn(
           duration: const Duration(seconds: 3),
           child: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 1.5.h),
            child: Text(
              "You are the happiest person in the world because you have no tasks for now",
              style: TextStyle(
                color: const Color.fromRGBO(255, 117, 98, 1),
                fontSize: 15.4.sp,
                height: 1.5,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.center,
            ),
                 ),
         ),
      ],
    );
  }
}
