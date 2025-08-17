import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

class ProgressBar extends StatelessWidget {
  final int taskCount;
  const ProgressBar(this.taskCount, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 9.w, right: 9.w, top: 8.h),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: taskCount == 0
                  ? const Color.fromRGBO(253, 87, 76, 1).withOpacity(0.2)
                  : Colors.greenAccent.withOpacity(0.2),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: CircularPercentIndicator(
                    radius: 65.0,
                    lineWidth: 7.0,
                    percent: 1,
                    animation: true,
                    animationDuration: 2400,
                    center: Text(
                      taskCount.toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          letterSpacing: 1.9,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"),
                    ),
                    progressColor: taskCount == 0
                        ? const Color.fromRGBO(253, 87, 76, 1)
                        : Colors.greenAccent,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Daily Tasks\n",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            color:
                                Colors.black //Color.fromRGBO(255, 216, 59, 1),
                            ),
                      ),
                      TextSpan(
                        text: taskCount == 0
                            ? "You can do it!"
                            : "You've done it!",
                        style: TextStyle(
                          fontSize: 11.7.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          height: 1.5,
                          color: Colors.grey,
                        ),
                      ),
                    ]),
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
