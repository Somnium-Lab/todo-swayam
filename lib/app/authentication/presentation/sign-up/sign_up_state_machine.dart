import 'package:flutter_todo_clean_arch/core/presentation/state-machine.dart';

class SignUpStateMachine extends StateMachine<SignUpState, SignUpEvent> {
  SignUpStateMachine() : super(SignUpInitState());

  @override
  SignUpState getStateOnEvent(SignUpEvent event) {
    final eventType = event.runtimeType;
    SignUpState newState = getCurrentState();

    switch (eventType) {
      case SignUpClickedEvent:
        newState = SignUpLoadingState();
        break;

      case SignUpErrorEvent:
        SignUpErrorEvent errorEvent = event as SignUpErrorEvent;
        newState = new SignUpErrorState(
            errorMessage: errorEvent.errorMessage,
            email: errorEvent.email,
            password: errorEvent.password,
            name: errorEvent.name);
        break;
    }

    return newState;
  }
}

abstract class SignUpState {}

class SignUpInitState implements SignUpState {}

class SignUpLoadingState implements SignUpState {}

class SignUpErrorState implements SignUpState {
  final String errorMessage;
  final String email;
  final String password;
  final String name;
  SignUpErrorState(
      {required this.errorMessage,
      required this.email,
      required this.name,
      required this.password});
}

abstract class SignUpEvent {}

class SignUpErrorEvent implements SignUpEvent {
  final String errorMessage;

  final String email;
  final String password;
  final String name;
  SignUpErrorEvent(
      {required this.errorMessage,
      required this.email,
      required this.password, 
      required this.name});
}

class SignUpClickedEvent implements SignUpEvent {}