import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/get_task_controller.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/get_task_state_machine.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/view/widget/get_task_content_body.dart';

class InitStateMobileView extends StatefulWidget {
  final GetTaskController getTaskController;
  final GetTaskInitializedState getTaskInitializedState;
  const InitStateMobileView({
    Key? key,
    required this.getTaskController,
    required this.getTaskInitializedState,
  }) : super(key: key);

  @override
  _InitStateMobileViewState createState() => _InitStateMobileViewState();
}

class _InitStateMobileViewState extends State<InitStateMobileView> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetTaskContentBody(
          getTaskController: widget.getTaskController,
          getTaskInitializedState: widget.getTaskInitializedState,
        ),
      ),
    );
  }
}