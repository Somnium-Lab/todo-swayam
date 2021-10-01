
import 'package:flutter_todo_clean_arch/core/presentation/state-machine.dart';

class SplashScreenStateMachine
    extends StateMachine<SplashScreenState, SplashScreenEvent> {
  SplashScreenStateMachine() : super(SplashScreenInitializationState());

  @override
  SplashScreenState getStateOnEvent(SplashScreenEvent event) {
    final eventType = event.runtimeType;
    SplashScreenState newState = getCurrentState();
    switch (eventType) {
    }

    return newState;
  }
}

abstract class SplashScreenState {}

class SplashScreenInitializationState extends SplashScreenState {}

abstract class SplashScreenEvent {}