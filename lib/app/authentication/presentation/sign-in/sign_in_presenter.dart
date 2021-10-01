import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/authentication/domain/usecase/sign_in_with_email_and_password_usecase.dart';
import 'package:flutter_todo_clean_arch/core/presentation/observer.dart';

class SignInPresenter extends Presenter {
  final SignInWithEmailAndPasswordUseCase userSignInUseCase;

  SignInPresenter(this.userSignInUseCase);

  @override
  void dispose() {
    userSignInUseCase.dispose();
  }

  void signInWithEmailAndPassword({
    required String email,
    required String password,
    required UseCaseObserver observer,
  }) {
    userSignInUseCase.execute(
      observer,
      new SignInWithEmailAndPasswordUseCaseParams(
        email: email,
        password: password,
      ),
    );
  }
}