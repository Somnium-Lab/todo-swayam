import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/authentication/domain/usecase/sign_up_with_email_and_password_usecase.dart';
import 'package:flutter_todo_clean_arch/core/presentation/observer.dart';

class SignUpPresenter extends Presenter {
  final SignUpWithEmailAndPasswordUseCase _signUpUseCase;

  SignUpPresenter(this._signUpUseCase);

  @override
  void dispose() {
    _signUpUseCase.dispose();
  }

  void signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required UseCaseObserver observer,
  }) {
    _signUpUseCase.execute(
        observer,
        new SignUpWithEmailAndPasswordUseCaseParams(
          email: email,
          password: password,
          name: name,
        ));
  }
}