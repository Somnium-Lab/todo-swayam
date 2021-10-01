import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/authentication/domain/usecase/check_user_login_status_usecase.dart';
import 'package:flutter_todo_clean_arch/core/presentation/observer.dart';

class SplashScreenPresenter extends Presenter {
  final CheckLoginStatusUsecase _checkUserSignInUseCase;
  SplashScreenPresenter(this._checkUserSignInUseCase);

  @override
  dispose() {
    _checkUserSignInUseCase.dispose();
  }

  void checkUserSignInStatus({required UseCaseObserver observer}) {
    _checkUserSignInUseCase.execute(observer);
  }
}