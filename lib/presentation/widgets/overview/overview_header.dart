import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../screens/task_screen.dart';

class OverviewHeader extends StatefulWidget {
  const OverviewHeader({Key? key}) : super(key: key);

  @override
  _OverviewHeaderState createState() => _OverviewHeaderState();
}

class _OverviewHeaderState extends State<OverviewHeader> {
  void _showModalBottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return const TaskScreen(
          task: null,
        );
      },
    ).then(
      (value) {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 9.w, top: 5.6.h, right: 9.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _showModalBottomSheet(context);
            },
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromRGBO(253, 87, 76, 1).withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                ],
                color: const Color.fromRGBO(253, 87, 76, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
