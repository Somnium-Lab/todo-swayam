import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/usecase/get_task_usecase.dart';
import 'package:flutter_todo_clean_arch/core/presentation/observer.dart';

class GetTaskPresenter implements Presenter {
  final GetTaskUsecase _getTaskUsecase;

  GetTaskPresenter(this._getTaskUsecase);

  @override
  void dispose() {
    _getTaskUsecase.dispose();
  }

  void getTask(UseCaseObserver observer) {
    _getTaskUsecase.execute(observer);
  }
}