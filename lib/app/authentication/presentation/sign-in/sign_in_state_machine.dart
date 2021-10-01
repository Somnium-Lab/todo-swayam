import 'package:flutter_todo_clean_arch/core/presentation/state-machine.dart';

class SignInStateMachine extends StateMachine<SignInState, SignInEvent> {
  SignInStateMachine() : super(new SignInInitState());

  @override
  SignInState getStateOnEvent(SignInEvent event) {
    final eventType = event.runtimeType;
    SignInState newState = getCurrentState();

    switch (eventType) {
      case SignInClickedEvent:
        newState = new SignInLoadingState();
        break;

      case SignInErrorEvent:
        SignInErrorEvent errorEvent = event as SignInErrorEvent;
        newState = new SignInErrorState(
            errorMessage: errorEvent.errorMessage,
            email: errorEvent.email,
            password: errorEvent.password);
        break;
    }

    return newState;
  }
}

class SignInState {}

class SignInErrorState implements SignInState {
  final String errorMessage;
  final String email;
  final String password;

  SignInErrorState(
      {required this.email,
      required this.password,
      required this.errorMessage});
}

class SignInInitState implements SignInState {}

class SignInLoadingState implements SignInState {}

class SignInEvent {}

class SignInClickedEvent implements SignInEvent {}

class SignInErrorEvent implements SignInEvent {
  final String errorMessage;
  final String email;
  final String password;

  SignInErrorEvent(
      {required this.errorMessage,
      required this.email,
      required this.password});
}