import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/entity/task_entity.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/edit_task/edit_task_controller.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/edit_task/edit_task_state_machine.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/edit_task/view/mobile/edit_task_init_state.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/edit_task/view/mobile/edit_task_error_state.dart';

class EditTaskView extends View {
  final EditTaskViewParams editTaskViewParams;

  EditTaskView(this.editTaskViewParams);

  @override
  State<StatefulWidget> createState() => EditTaskViewState();
}

class EditTaskViewState
    extends ResponsiveViewState<EditTaskView, EditTaskController> {
  EditTaskViewState() : super(new EditTaskController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<EditTaskController>(
        builder: (builder, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;
      print('Mobile view : $currentStateType');

      switch (currentStateType) {
        case EditTaskInitState:
          return InitStateMobileView(editTaskController: controller, task: widget.editTaskViewParams.task,);

        case EditTaskErrorState:
          return ErrorStateMobileView(editTaskController: controller);

        default:
          throw Exception(
              "Unknown Exception : $currentStateType : AddTaskView");
      }
    });
  }

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}

class EditTaskViewParams {
  final TaskEntity task;

  EditTaskViewParams(this.task);
}