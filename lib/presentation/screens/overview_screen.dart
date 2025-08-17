import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app/config/constants/palette.dart';
import '../../logic/controllers/database_helper.dart';
import '../../data/models/task.dart';
import 'task_screen.dart';
import 'task_completed_screen.dart';
import '../widgets/overview/no_data_screen.dart';
import '../widgets/overview/overview_header.dart';
import '../widgets/overview/overview_task_title.dart';
import '../widgets/overview/progress_bar.dart';
import '../widgets/overview/slide_left_bacground.dart';
import '../widgets/overview/task_bubble.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  List colors = [
    AppColors.kRedColor,
    AppColors.kOrangeColor,
    AppColors.kBlueColor,
    AppColors.kPurpleColor,
    AppColors.kGreenColor,
  ];
  Random random = Random();
  int indexColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            const OverviewHeader(),
            FutureBuilder<List<Task>>(
                initialData: const [],
                future: _dbHelper.getTasks(),
                builder: (context, snapshot) {
                  return ProgressBar(snapshot.data?.length ?? 0);
                }),
            FutureBuilder<List<Task>>(
                initialData: const [],
                future: _dbHelper.getTasks(),
                builder: (context, snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 9.w,
                          top: 5.2.h,
                        ),
                        child: OverviewTaskTitle(snapshot.data?.length ?? 0),
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 9.w, top: 5.2.h),
                          child: const Icon(Icons.task_alt_sharp))
                    ],
                  );
                }),
            FutureBuilder<List<Task>>(
                initialData: const [],
                future: _dbHelper.getTasks(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                        reverse: true,
                        itemCount: snapshot.data!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Dismissible(
                              movementDuration: const Duration(seconds: 2),
                              resizeDuration:
                                  const Duration(milliseconds: 1300),
                              onDismissed: (direction) async {
                                if (snapshot.data![index].id != null &&
                                    snapshot.data![index].id != 0) {
                                  await _dbHelper
                                      .deleteTask(snapshot.data![index].id!);

                                  setState(() {
                                    if (snapshot.data!.length <= 1) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CompletedScreen()));
                                    }
                                  });
                                }
                                snapshot.data!.removeAt(index);
                              },
                              background: const SlideLeftBackground(),
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              child: GestureDetector(
                                  onTap: () {
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
                                        return TaskScreen(
                                          task: snapshot.data![index],
                                        );
                                      },
                                    ).then(
                                      (value) {
                                        setState(() {});
                                      },
                                    );
                                  },
                                  child: TaskBubble(
                                    title: snapshot.data![index].title ?? '',
                                    desc:
                                        snapshot.data![index].description ?? '',
                                    color: colors[random.nextInt(5)],
                                  )),
                            ));
                  } else {
                    return const NoDataScreen();
                  }
                }),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
