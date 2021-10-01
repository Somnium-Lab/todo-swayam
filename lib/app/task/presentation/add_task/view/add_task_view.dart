import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/add_task/add_task_controller.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/add_task/add_task_state_machine.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/add_task/view/mobile/add_task_error_state.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/add_task/view/mobile/add_task_init_state.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/add_task/view/mobile/add_task_loading_state.dart';

class AddTaskView extends View {
  @override
  State<StatefulWidget> createState() => AddTaskViewState();
}

class AddTaskViewState
    extends ResponsiveViewState<AddTaskView, AddTaskController> {
  AddTaskViewState() : super(new AddTaskController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<AddTaskController>(
        builder: (builder, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;
      print('Mobile view : $currentStateType');

      switch (currentStateType) {
        case AddTaskInitState:
          return InitStateMobileView(addTaskController: controller);

        case AddTaskLoadingState:
          return LoadingStateMobileView();

        case AddTaskErrorState:
          return ErrorStateMobileView(addTaskController: controller);

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