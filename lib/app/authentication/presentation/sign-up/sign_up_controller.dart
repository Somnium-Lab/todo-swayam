import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/sign_up_presenter.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/sign_up_state_machine.dart';
import 'package:flutter_todo_clean_arch/app/navigation-service.dart';
import 'package:flutter_todo_clean_arch/core/presentation/observer.dart';
import 'package:flutter_todo_clean_arch/injection-container.dart';

class SignUpController extends Controller {
  final SignUpStateMachine _stateMachine;
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();
  final SignUpPresenter _presenter;

  SignUpController()
      : _stateMachine = new SignUpStateMachine(),
        _presenter = serviceLocator<SignUpPresenter>(),
        super();

  @override
  void initListeners() {}

  SignUpState getCurrentState() {
    return _stateMachine.getCurrentState();
  }

  signUpWithEmailAndPassword(
      {required String email, required String password, required String name}) {
    _stateMachine.onEvent(new SignUpClickedEvent());
    refreshUI();

    _presenter.signUpWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
      observer: new UseCaseObserver(
        () {
          _navigationService.navigateTo(NavigationService.homePageRoute,
              shouldReplace: true);
        },
        (error) {
          _stateMachine.onEvent(
            new SignUpErrorEvent(
                errorMessage: error.toString(), email: email, password: password, name: name),
          );
          refreshUI();
        },
      ),
    );
  }

  void navigateToSignIn() {
    _navigationService.navigateTo(NavigationService.signInPageRoute,
        shouldReplace: true);
  }
}