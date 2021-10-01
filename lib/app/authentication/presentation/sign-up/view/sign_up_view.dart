import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/sign_up_controller.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/sign_up_state_machine.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/view/mobile/sign_up_error_state.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/view/mobile/sign_up_init_state.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/view/mobile/sign_up_loading_state.dart';

class SignUpView extends View {
  @override
  State<StatefulWidget> createState() => SignUpViewState();
}

class SignUpViewState
    extends ResponsiveViewState<SignUpView, SignUpController> {
  SignUpViewState() : super(new SignUpController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<SignUpController>(
        builder: (context, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;
      final SignUpState _state = controller.getCurrentState();


      print("Mobile View Called with state : $currentStateType");

      switch (currentStateType) {
        case SignUpInitState:
          return SignUpInitMobileView(
            controller: controller,
          );

        case SignUpLoadingState:
          return SignUpMobileLoadingView();

        case SignUpErrorState:
        SignUpErrorState errorState = _state as SignUpErrorState;
          return SignUpMobileErrorView(
            controller: controller,
            errorState: errorState,
          );

        default:
          throw Exception("Unknown state $currentStateType : SignUpView");
      }
    });
  }


  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}