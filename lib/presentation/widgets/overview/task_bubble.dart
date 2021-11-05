import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TaskBubble extends StatelessWidget {
  final String title;
  final String desc;
  final Color color;

  const TaskBubble({Key key, this.title, this.desc, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 9.w, right: 9.w, top: 4.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), 
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, top: 25, right: 30),
                                  child: Text(title ?? "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.7.sp,
                                          letterSpacing: 0.8,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins")),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, top: 10, bottom: 25, right: 30),
                                  child: Text(
                                    desc ?? "",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 10.5.sp,
                                        letterSpacing: 0.4,
                                        color: Colors.white),
                                  ),
                                ),
                              ]),
                        ),
                      ]),
                ),
                ZoomIn(
                  duration: const Duration(seconds: 2),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20, right: 15),
                    child: Icon(
                      Icons.design_services,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
