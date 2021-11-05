import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../screens/overview_screen.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 6.7.w, bottom: 4.2.h),
      child: CircleAvatar(
        radius: 4.2.h,
        backgroundColor: const Color.fromRGBO(0, 191, 166, 1),
        child: IconButton(
            iconSize: 4.2.h,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OverviewScreen()));
            },
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            )),
      ),
    );
  }
}
