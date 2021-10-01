import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/splash_screen/splash_screen_controller.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/splash_screen/splash_screen_state_machine.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/splash_screen/view/widget/splash_screen_widget.dart';

class SplashScreenView extends View {
  @override
  State<StatefulWidget> createState() => SplashScreenViewState();
}

class SplashScreenViewState
    extends ResponsiveViewState<SplashScreenView, SplashScreenController> {
  SplashScreenViewState() : super(new SplashScreenController());

  @override
  Widget get desktopView {
    return ControlledWidgetBuilder<SplashScreenController>(
        builder: (context, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;

      switch (currentStateType) {
        case SplashScreenInitializationState:
          return SplashScreenWidget(
            controller: controller,
          );

        default:
          throw Exception('Invalid State $currentStateType : SplashScreenView - Desktop');
      }
    });
  }

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<SplashScreenController>(
        builder: (context, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;

      switch (currentStateType) {
        case SplashScreenInitializationState:
          return SplashScreenWidget(
            controller: controller,
          );

        default:
          throw Exception('Invalid State $currentStateType : SplashScreenView - Mobile');
      }
    });
  }

  @override
  Widget get tabletView{
    return mobileView;
  }

  @override
  Widget get watchView => throw UnimplementedError();
}