import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'overview_screen.dart';
import '../../logic/controllers/database_helper.dart';
import '../../data/models/task.dart';

class TaskScreen extends StatefulWidget {
  final Task? task;

  const TaskScreen({Key? key, required this.task}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  int? _taskId = 0;
  String? _taskTitle = "";
  String? _taskDescription = "";

  FocusNode? _titleFocus;
  FocusNode? _descriptionFocus;

  bool _descriptionVisible = false;
  @override
  void initState() {
    if (widget.task != null) {
      // Set visibility to true
      _descriptionVisible = true;

      _taskTitle = widget.task?.title;
      _taskDescription = widget.task?.description;
      _taskId = widget.task?.id;
    }

    _titleFocus = FocusNode();
    _descriptionFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _titleFocus?.dispose();
    _descriptionFocus?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(left: 10.w, right: 10.w, top: 30, bottom: 30),
            child: TextField(
              focusNode: _titleFocus,
              autocorrect: true,
              textCapitalization: TextCapitalization.sentences,
              enableSuggestions: true,
              onSubmitted: (value) async {
                if (value != "") {
                  // Check if the task is null
                  if (widget.task == null) {
                    Task newTask = Task(
                      title: value,
                    );
                    _taskId = await _dbHelper.insertTask(newTask);
                    setState(() {
                      _descriptionVisible = true;
                      _taskTitle = value;
                    });
                  } else {
                    await _dbHelper.updateTaskTitle(_taskId ?? 0, value);
                  }
                  _descriptionFocus?.requestFocus();
                }
              },
              controller: TextEditingController()..text = _taskTitle ?? "",
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.title_rounded,
                  color: Color.fromRGBO(253, 87, 76, 1),
                ),
                hintText: "Task Title",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 19,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Visibility(
            visible: _descriptionVisible,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 10.w, right: 10.w, top: 20, bottom: 30),
              child: TextField(
                focusNode: _descriptionFocus,
                autocorrect: true,
                textCapitalization: TextCapitalization.sentences,
                enableSuggestions: true,
                onSubmitted: (value) async {
                  if (value != "") {
                    if (_taskId != 0) {
                      await _dbHelper.updateTaskDescription(
                          _taskId ?? 0, value);
                      _taskDescription = value;
                    }
                  }
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const OverviewScreen(),
                    ),
                    (route) => false,
                  );
                },
                controller: TextEditingController()
                  ..text = _taskDescription ?? "",
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.description_outlined,
                    color: Color.fromRGBO(253, 87, 76, 1),
                  ),
                  hintText: "Task Description",
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom)),
        ],
      ),
    );
  }
}
