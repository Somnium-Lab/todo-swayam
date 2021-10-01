
import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/authentication/domain/repository/authentication_repository.dart';

class SignInWithEmailAndPasswordUseCase extends CompletableUseCase<SignInWithEmailAndPasswordUseCaseParams>{
  final AuthenticationRepository _repository;
  
  SignInWithEmailAndPasswordUseCase(this._repository);

  @override 
  Future<Stream<void>> buildUseCaseStream(params) async {

    final StreamController streamController = StreamController();

    try{
      await _repository.signInWithEmailAndPassword( email: params!.email, password: params.password);
      print("Authentication Successfull : SignInWithEmailAndPasswordUseCase");
      streamController.close();

    }catch(error){
      print("error in authentication: $error: SignInWithEmailAndPasswordUseCase");
      streamController.addError(error);
    }

    return streamController.stream;

  }
}

class SignInWithEmailAndPasswordUseCaseParams{
  final String email;
  final String password;

  SignInWithEmailAndPasswordUseCaseParams({required this.email, required this.password});
}