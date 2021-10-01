
import 'package:flutter_todo_clean_arch/core/presentation/state-machine.dart';

class AddTaskStateMachine extends StateMachine<AddTaskState, AddTaskEvent> {
  AddTaskStateMachine() : super(AddTaskInitState());

  @override
  AddTaskState getStateOnEvent(AddTaskEvent event) {
    final eventType = event.runtimeType;
    AddTaskState newState = getCurrentState();
    switch (eventType) {
      case AddTaskClickEvent:
        newState = new AddTaskLoadingState();
        break;

      case AddTaskErrorEvent:
        newState = new AddTaskErrorState();
        break;
    }
    return newState;
  }
}

class AddTaskEvent {}

class AddTaskClickEvent extends AddTaskEvent {}

class AddTaskErrorEvent extends AddTaskEvent {}

class AddTaskState {}

class AddTaskInitState extends AddTaskState {}

class AddTaskErrorState extends AddTaskState {}

class AddTaskLoadingState extends AddTaskState {}