import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/authentication/domain/repository/authentication_repository.dart';

class CheckLoginStatusUsecase extends CompletableUseCase<void>{
  final AuthenticationRepository _repository;
  CheckLoginStatusUsecase(this._repository);

  @override 
  Future<Stream<void>> buildUseCaseStream (params) async {
    final StreamController<void> streamController = StreamController();

    try{
      bool status = _repository.checkLoginStatus();
      streamController.add(status);
      print("Splash Screen Executed Successfully : CheckLoginStatusUsecase");
      streamController.close();
    }catch(error){
      print("Splash Screen Executed Unsuccessfully : $error : CheckLoginStatusUsecase");
      streamController.addError(error);
    }
    return streamController.stream;
  }
}