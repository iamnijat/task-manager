import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../screens/overview_screen.dart';

class CompleteButton extends StatelessWidget {
  const CompleteButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Padding(
        padding: EdgeInsets.only(top: 7.2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 117, 98, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OverviewScreen()));
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 35, right: 43),
                      child: Center(
                        child: Text(
                          "Create Another Task",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.2.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
