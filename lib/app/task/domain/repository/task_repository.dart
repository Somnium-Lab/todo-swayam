import 'package:flutter_todo_clean_arch/app/task/domain/entity/task_entity.dart';

abstract class TaskRepository {
  Future<void> addTask({
    required String title,
    required String description,
  });

  Future<List<TaskEntity>> getTask();

  Future<void> editTask(
      {required String title,
      required String description,
      required String itemId});
}