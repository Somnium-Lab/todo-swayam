import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-in/sign_in_controller.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-in/sign_in_state_machine.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-in/view/mobile/sign_in_error_state.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-in/view/mobile/sign_in_init_state.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-in/view/mobile/sign_in_loading_state.dart';

class SignInView extends View {
  @override
  State<StatefulWidget> createState() => SignInViewState();
}

class SignInViewState
    extends ResponsiveViewState<SignInView, SignInController> {
  SignInViewState() : super(new SignInController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<SignInController>(
        builder: (context, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;
      final SignInState _state = controller.getCurrentState();

      print("Mobile View Called with state : $currentStateType");

      switch (currentStateType) {
        case SignInInitState:
          return SignInMobileInitView(
            controller: controller,
          );

        case SignInLoadingState:
          return SignInMobileLoadingView();

        case SignInErrorState:
          SignInErrorState errorState = _state as SignInErrorState;
          return SignInMobileErrorView(
            controller: controller,
            errorState: errorState,
          );

        default:
          throw Exception("Unknown state $currentStateType : SignInView");
      }
    });
  }

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}