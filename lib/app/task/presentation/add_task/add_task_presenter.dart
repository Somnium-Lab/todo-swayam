import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/usecase/add_task_usecase.dart';
import 'package:flutter_todo_clean_arch/core/presentation/observer.dart';

class AddTaskPresenter implements Presenter {
  final AddTaskUsecase _addTaskUsecase;

  AddTaskPresenter(this._addTaskUsecase);

  @override
  void dispose() {
    _addTaskUsecase.dispose();
  }

  void addTask(
    UseCaseObserver observer, {
    required String title,
    required String description,
  }) {
    _addTaskUsecase.execute(
        observer,
        new AddTaskUsecaseParams(
          title: title,
          description: description,
        ));
  }



  
}








