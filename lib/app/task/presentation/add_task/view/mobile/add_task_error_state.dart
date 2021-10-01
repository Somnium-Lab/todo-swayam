import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/add_task/add_task_controller.dart';

class ErrorStateMobileView extends StatefulWidget {
  final AddTaskController addTaskController;

  const ErrorStateMobileView({Key? key, required this.addTaskController})
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
          child: Text('Error'),
        ));
  }
}