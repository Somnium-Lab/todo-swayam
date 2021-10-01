import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/repository/task_repository.dart';

class AddTaskUsecase extends CompletableUseCase<AddTaskUsecaseParams> {
  final TaskRepository _taskRepository;

  AddTaskUsecase(this._taskRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController streamController = StreamController();

    try {
      await _taskRepository.addTask(
          title: params!.title, description: params.description);
      streamController.close();
    } catch (e) {
      print('Error : $e : Add Task Usecase ');
      streamController.addError(e);
    }

    return streamController.stream;
  }
}

class AddTaskUsecaseParams {
  final String title;
  final String description;

  AddTaskUsecaseParams({
    required this.title,
    required this.description,
  });
}