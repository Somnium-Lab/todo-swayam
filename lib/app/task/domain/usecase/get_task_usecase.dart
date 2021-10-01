import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/entity/task_entity.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/repository/task_repository.dart';

class GetTaskUsecase extends CompletableUseCase<void> {
  final TaskRepository _taskRepository;

  GetTaskUsecase(this._taskRepository);

  @override
  Future<Stream<List<TaskEntity>>> buildUseCaseStream(params) async {
    final StreamController<List<TaskEntity>> streamController=StreamController();

    try {
      List<TaskEntity> _taskList = await _taskRepository.getTask();
      streamController.add(_taskList);
      streamController.close();
    } catch (e) {
      print("Error : $e Get Task Usecase ");
      streamController.addError(e);
    }
return streamController.stream;
  }
}