import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/add_task/add_task_controller.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/add_task/view/widget/add_task_content_body.dart';

class InitStateMobileView extends StatefulWidget {
  final AddTaskController addTaskController;
  const InitStateMobileView({Key? key, required this.addTaskController})
      : super(key: key);

  @override
  _InitStateMobileViewState createState() => _InitStateMobileViewState();
}

class _InitStateMobileViewState extends State<InitStateMobileView> {
  late final TextEditingController _title;
  late final TextEditingController _description;

  @override
  void initState() {
    _title = new TextEditingController();
    _description = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: AddTaskContentBody(addTaskController: widget.addTaskController, title: _title, description: _description)),
    );
  }
}