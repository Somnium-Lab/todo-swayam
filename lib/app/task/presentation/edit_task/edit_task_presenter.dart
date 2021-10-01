import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/usecase/edit_task_usecase.dart';
import 'package:flutter_todo_clean_arch/core/presentation/observer.dart';

class EditTaskPresenter implements Presenter {
  final EditTaskUsecase _editTaskUsecase;

  EditTaskPresenter(this._editTaskUsecase);

  @override
  void dispose() {
    _editTaskUsecase.dispose();
  }

  void editTask(
    UseCaseObserver observer, {
    required String title,
    required String description,
    required String itemId,
  }) {
    _editTaskUsecase.execute(
        observer,
        new EditTaskUsecaseParams(
          title: title,
          description: description,
          itemId: itemId,
        ));
  }
}