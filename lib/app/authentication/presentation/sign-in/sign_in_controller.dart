import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-in/sign_in_presenter.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-in/sign_in_state_machine.dart';
import 'package:flutter_todo_clean_arch/app/navigation-service.dart';
import 'package:flutter_todo_clean_arch/core/presentation/observer.dart';
import 'package:flutter_todo_clean_arch/injection-container.dart';

class SignInController extends Controller {
  final SignInStateMachine _stateMachine;
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();
  final SignInPresenter _presenter;

  SignInController()
      : _stateMachine = new SignInStateMachine(),
        _presenter = serviceLocator<SignInPresenter>(),
        super();

  @override
  void initListeners() {}

  SignInState getCurrentState() {
    return _stateMachine.getCurrentState();
  }

  signInWithEmailAndPassword(
      {required String email, required String password}) {
    _stateMachine.onEvent(new SignInClickedEvent());
    refreshUI();

    _presenter.signInWithEmailAndPassword(
      observer: new UseCaseObserver(
        () {
          _navigationService.navigateTo(NavigationService.homePageRoute,
              shouldReplace: true);
        },
        (error) {
          _stateMachine.onEvent(
            new SignInErrorEvent(
              errorMessage: error.toString(),
              email: email,
              password: password,
            ),
          );
          refreshUI();
        },
      ),
      email: email,
      password: password,
    );
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(NavigationService.signUpPageRoute,
        shouldReplace: true);
  }
}