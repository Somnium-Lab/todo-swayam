import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/authentication/domain/repository/authentication_repository.dart';

class SignUpWithEmailAndPasswordUseCase extends CompletableUseCase<SignUpWithEmailAndPasswordUseCaseParams> {
  final AuthenticationRepository _repository;

  SignUpWithEmailAndPasswordUseCase(this._repository);
  @override 
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController streamController = StreamController();
    try {
      await _repository.signUpWithEmailAndPassword(
          name: params?.name, email: params!.email, password: params.password);
      print("Authentication successful : SignUpWithEmailAndPasswordUseCase");
      streamController.close();
    } catch (error) {
      print(
          "error in Authentication : $error :SignUpWithEmailAndPasswordUseCase");
      streamController.addError(error);
    }
    return streamController.stream;
  }
}

class SignUpWithEmailAndPasswordUseCaseParams {
  String name;
  String email;
  String password;

  SignUpWithEmailAndPasswordUseCaseParams(
      {required this.name, required this.email, required this.password});
}