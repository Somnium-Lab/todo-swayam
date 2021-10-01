import 'package:flutter_todo_clean_arch/app/task/domain/entity/task_entity.dart';
import 'package:flutter_todo_clean_arch/core/presentation/state-machine.dart';

class GetTaskStateMachine extends StateMachine<GetTaskState, GetTaskEvent> {
  GetTaskStateMachine() : super(GetTaskInitializationState());

  @override
  GetTaskState getStateOnEvent(GetTaskEvent event) {
    final eventType = event.runtimeType;
    GetTaskState newState = getCurrentState();

    switch (eventType) {
      case GetTaskInitializedEvent:
        GetTaskInitializedEvent getTaskInitializedEvent = event as GetTaskInitializedEvent;
        newState = new GetTaskInitializedState(
            taskList: getTaskInitializedEvent.taskList);
        break;

      case GetTaskErrorEvent:
        newState = new GetTaskErrorState();
        break;

      case GetTaskIntializationEvent:
        newState = new GetTaskInitializationState();
        break;
    }

    return newState;
  }
}

class GetTaskInitializationState extends GetTaskState {}

class GetTaskIntializationEvent extends GetTaskEvent {}

class GetTaskInitializedState extends GetTaskState {
  final List<TaskEntity> taskList;

  GetTaskInitializedState({required this.taskList});
}

class GetTaskInitializedEvent extends GetTaskEvent {
  final List<TaskEntity> taskList;

  GetTaskInitializedEvent({required this.taskList});
}

class GetTaskState {}

class GetTaskEvent {}

class GetTaskErrorEvent extends GetTaskEvent {}

class GetTaskErrorState extends GetTaskState {}