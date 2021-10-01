import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/navigation-service.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/add_task/add_task_presenter.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/add_task/add_task_state_machine.dart';
import 'package:flutter_todo_clean_arch/core/presentation/observer.dart';
import 'package:flutter_todo_clean_arch/injection-container.dart';

class AddTaskController extends Controller {
  final AddTaskPresenter _addTaskPresenter;
  final AddTaskStateMachine _addTaskStateMachine = new AddTaskStateMachine();

  final NavigationService _navigationService=serviceLocator<NavigationService>();

  AddTaskController()
    : _addTaskPresenter = serviceLocator<AddTaskPresenter>(),
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

  AddTaskState getCurrentState() {
    return _addTaskStateMachine.getCurrentState();
  }

  void addTask({required String title, required String description}) {
    _addTaskPresenter.addTask(
      new UseCaseObserver(
        () {
          _navigationService.navigateTo(NavigationService.homePageRoute,
              shouldReplace: true);
        },
        (error) {
          _addTaskStateMachine.onEvent(new AddTaskErrorEvent());
          refreshUI();
        },
      ),
      title: title,
      description: description,
    );
  }

}