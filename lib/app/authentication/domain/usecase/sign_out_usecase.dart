
import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/authentication/domain/repository/authentication_repository.dart';
import 'package:flutter_todo_clean_arch/injection-container.dart';

class SignOutUseCase extends CompletableUseCase<void> {
  final AuthenticationRepository _repository;

  SignOutUseCase(this._repository);

  @override 
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController streamController = StreamController();

    try{
      await reset();
      await _repository.signOut();
      print("SignOut Successful : SignOutUseCase");
      streamController.close();
    }catch(error){
      print("Error in SignOut : $error SignOutUseCase");
      streamController.addError(error);
    }
    return streamController.stream;

  }
}