import 'package:flutter_todo_clean_arch/core/presentation/state-machine.dart';

class EditTaskStateMachine extends StateMachine<EditTaskState, EditTaskEvent> {
  EditTaskStateMachine() : super(EditTaskInitState());

  @override
  EditTaskState getStateOnEvent(EditTaskEvent event) {
    final eventType = event.runtimeType;

    EditTaskState newState = getCurrentState();
    switch (eventType) {
      case EditTaskErrorEvent:
        newState = new EditTaskErrorState();
        break;

      case EditTaskClickEvent:
        newState = new EditTaskLoadingState();
        break;
    }
    return newState;
  }
}

class EditTaskState {}

class EditTaskEvent {}

class EditTaskInitState extends EditTaskState {}

class EditTaskLoadingState extends EditTaskState {}

class EditTaskClickEvent extends EditTaskEvent {}

class EditTaskErrorState extends EditTaskState {}

class EditTaskErrorEvent extends EditTaskEvent {}