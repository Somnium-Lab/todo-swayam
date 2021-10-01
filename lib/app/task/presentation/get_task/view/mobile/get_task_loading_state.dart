import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/get_task_controller.dart';

class LoadingStateMobileView extends StatefulWidget {
  final GetTaskController getTaskController;

  const LoadingStateMobileView({Key? key, required this.getTaskController})
      : super(key: key);

  @override
  _LoadingStateMobileViewState createState() => _LoadingStateMobileViewState();
}

class _LoadingStateMobileViewState extends State<LoadingStateMobileView> {
  @override
  Widget build(BuildContext context) {
    widget.getTaskController.getTask();
   
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}