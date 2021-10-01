import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/splash_screen/splash_screen_presenter.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/splash_screen/splash_screen_state_machine.dart';
import 'package:flutter_todo_clean_arch/app/navigation-service.dart';
import 'package:flutter_todo_clean_arch/core/presentation/observer.dart';
import 'package:flutter_todo_clean_arch/injection-container.dart';

class SplashScreenController extends Controller {
  final SplashScreenPresenter _presenter;
  final SplashScreenStateMachine _stateMachine;
  final NavigationService _navigationService;

  SplashScreenController()
      : _presenter = serviceLocator<SplashScreenPresenter>(),
        _stateMachine = new SplashScreenStateMachine(),
        _navigationService = serviceLocator<NavigationService>(),
        super();

  @override
  void initListeners() {}

  @override
  void onInitState();

  void onDispose() {
    _presenter.dispose();
  }

  SplashScreenState getCurrentState() {
    return _stateMachine.getCurrentState();
  }

  void checkUserSignIn() {
    _presenter.checkUserSignInStatus(
      observer: new UseCaseObserver(
        () {},
        (error) {
          _navigationService.navigateTo(NavigationService.signInPageRoute,
              shouldReplace: true);
        },
        onNextFunc: (bool signInStatus) {
          if (signInStatus)
            _navigationService.navigateTo(
                NavigationService
                    .homePageRoute, //Home page route needs to be added in navigation service
                shouldReplace: true);
          else
            _navigationService.navigateTo(NavigationService.signInPageRoute,
                shouldReplace: true);
        },
      ),
    );
  }
}