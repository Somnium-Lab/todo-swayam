import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/entity/task_entity.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/edit_task/edit_task_controller.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/edit_task/view/widget/edit_task_cotent_body.dart';

class InitStateMobileView extends StatefulWidget {
  final EditTaskController editTaskController;
  final TaskEntity task;
  const InitStateMobileView(
      {Key? key, required this.editTaskController, required this.task})
      : super(key: key);

  @override
  _InitStateMobileViewState createState() => _InitStateMobileViewState();
}

class _InitStateMobileViewState extends State<InitStateMobileView> {
  late final TextEditingController titleTextEditingController;

  late final TextEditingController descriptionTextEditingController;

  void initState() {
    titleTextEditingController =
        new TextEditingController(text: widget.task.title);
    descriptionTextEditingController =
        new TextEditingController(text: widget.task.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: EditTaskContentBody(
        title: titleTextEditingController,
        description: descriptionTextEditingController,
        editTaskController: widget.editTaskController,
        task: widget.task,
      )),
    );
  }
}