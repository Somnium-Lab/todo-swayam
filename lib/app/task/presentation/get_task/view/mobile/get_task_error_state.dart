import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/get_task_controller.dart';

class ErrorStateMobileView extends StatefulWidget {
  final GetTaskController getTaskController;

  const ErrorStateMobileView({Key? key, required this.getTaskController})
      : super(key: key);

  @override
  _ErrorStateMobileViewState createState() => _ErrorStateMobileViewState();
}

class _ErrorStateMobileViewState extends State<ErrorStateMobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text("Error"),
        )
    );
  }
}