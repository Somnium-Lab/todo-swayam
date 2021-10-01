import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/get_task_controller.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/get_task_state_machine.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/view/mobile/get_task_error_state.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/view/mobile/get_task_init_state.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/view/mobile/get_task_loading_state.dart';

class GetTaskView extends View {
  @override
  State<StatefulWidget> createState() => GetTaskViewState();
}

class GetTaskViewState
    extends ResponsiveViewState<GetTaskView, GetTaskController> {
  GetTaskViewState() : super(new GetTaskController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<GetTaskController>(
        builder: (builder, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;
      final state = controller.getCurrentState();
      print('Mobile View : $currentStateType');

      switch (currentStateType) {
        case GetTaskInitializationState:
          return LoadingStateMobileView(getTaskController: controller);

        case GetTaskInitializedState:
          GetTaskInitializedState getTaskInitializedState =
              state as GetTaskInitializedState;
          return InitStateMobileView(
            getTaskController: controller,
            getTaskInitializedState: getTaskInitializedState,
          );

        case GetTaskErrorState:
          return ErrorStateMobileView(getTaskController: controller);

        default:
          throw Exception(
              "Unknown Exception : $currentStateType : GetTaskView");
      }
    });
  }

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}