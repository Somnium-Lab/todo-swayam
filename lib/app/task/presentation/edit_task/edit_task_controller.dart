import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_todo_clean_arch/app/navigation-service.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/edit_task/edit_task_presenter.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/edit_task/edit_task_state_machine.dart';
import 'package:flutter_todo_clean_arch/core/presentation/observer.dart';
import 'package:flutter_todo_clean_arch/injection-container.dart';

class EditTaskController extends Controller {
  final EditTaskPresenter _editTaskPresenter;

  final EditTaskStateMachine _editTaskStateMachine = new EditTaskStateMachine();

  final NavigationService _navigationService = serviceLocator<NavigationService>();

  EditTaskController()
      : _editTaskPresenter = serviceLocator<EditTaskPresenter>(),
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

  EditTaskState getCurrentState() {
    return _editTaskStateMachine.getCurrentState();
  }

  void editTask({
    required String title,
    required String description,
    required String itemId,
  }) {
    _editTaskPresenter.editTask(
      new UseCaseObserver(
        () {
          _navigationService.navigateTo(NavigationService.homePageRoute,
          shouldReplace: true);
        },
        (error) {
          _editTaskStateMachine.onEvent(new EditTaskErrorEvent());
          refreshUI();
        },
      ),
      title: title,
      description: description,
      itemId: itemId,
    );
  }
}