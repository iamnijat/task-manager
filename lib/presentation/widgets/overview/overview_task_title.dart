import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OverviewTaskTitle extends StatelessWidget {
  final int taskCount;
  const OverviewTaskTitle(this.taskCount, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      taskCount == 0
          ? "You have no task for today"
          : "You have $taskCount tasks for today",
      style: TextStyle(
        color: Colors.black,
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.6,
        fontFamily: "Poppins",
      ),
    );
  }
}
