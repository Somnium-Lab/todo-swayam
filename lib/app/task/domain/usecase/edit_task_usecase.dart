import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/repository/task_repository.dart';

class EditTaskUsecase extends CompletableUseCase<EditTaskUsecaseParams> {
  final TaskRepository _taskRepository;

  EditTaskUsecase(this._taskRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController streamController = StreamController();

    try {
      await _taskRepository.editTask(
        title: params!.title,
        description: params.description,
        itemId: params.itemId,
      );
      streamController.close();
    } catch (e) {
      print('Error : $e : Update Task Usecase ');
      streamController.addError(e);
    }

    return streamController.stream;
  }
}

class EditTaskUsecaseParams {
  final String title;
  final String description;
  final String itemId;

  EditTaskUsecaseParams({
    required this.title,
    required this.description,
    required this.itemId,
  });
}