import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/navigation-service.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/entity/task_entity.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/edit_task/view/edit_task_view.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/get_task_presenter.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/get_task_state_machine.dart';
import 'package:flutter_todo_clean_arch/core/presentation/observer.dart';
import 'package:flutter_todo_clean_arch/injection-container.dart';

class GetTaskController extends Controller {
  final GetTaskPresenter _getTaskPresenter;
  final GetTaskStateMachine _getTaskStateMachine = new GetTaskStateMachine();
  final NavigationService _navigationService = serviceLocator<NavigationService>();
  GetTaskController()
      : _getTaskPresenter = serviceLocator<GetTaskPresenter>(),
        super();

  @override
  void initListeners() {}

  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  void onDisposed() {
    super.onDisposed();
  }

  GetTaskState getCurrentState() {
    return _getTaskStateMachine.getCurrentState();
  }

  void getTask() {
    _getTaskPresenter.getTask(new UseCaseObserver(() {
      print("Get task fetched 2");
    }, (error) {
      _getTaskStateMachine.onEvent(new GetTaskErrorEvent());
      refreshUI();
    }, onNextFunc: (List<TaskEntity> taskList) {
      _getTaskStateMachine
          .onEvent(new GetTaskInitializedEvent(taskList: taskList));
      refreshUI();
    }));
  }

  void navigateToEditPage({required TaskEntity task}) {
    _navigationService.navigateTo(NavigationService.editTaskPageRoute, arguments: new EditTaskViewParams(task))
        .then((value) {
      _getTaskStateMachine.onEvent(new GetTaskIntializationEvent());
      refreshUI();
    });
  }

  void navigateToAddPage() {
    _navigationService
        .navigateTo(NavigationService.addTaskPageRoute)
        .then((value) {
      _getTaskStateMachine.onEvent(new GetTaskIntializationEvent());
      refreshUI();
    });
  }
}