import 'package:get_it/get_it.dart';
import 'package:flutter_todo_clean_arch/app/authentication/data/authentication_repository_impl.dart';
import 'package:flutter_todo_clean_arch/app/authentication/domain/repository/authentication_repository.dart';
import 'package:flutter_todo_clean_arch/app/authentication/domain/usecase/check_user_login_status_usecase.dart';
import 'package:flutter_todo_clean_arch/app/authentication/domain/usecase/sign_in_with_email_and_password_usecase.dart';
import 'package:flutter_todo_clean_arch/app/authentication/domain/usecase/sign_out_usecase.dart';
import 'package:flutter_todo_clean_arch/app/authentication/domain/usecase/sign_up_with_email_and_password_usecase.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-in/sign_in_presenter.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/sign_up_presenter.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/splash_screen/splash_screen_presenter.dart';
import 'package:flutter_todo_clean_arch/app/navigation-service.dart';
import 'package:flutter_todo_clean_arch/app/task/data/task_repository_impl.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/repository/task_repository.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/usecase/add_task_usecase.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/usecase/edit_task_usecase.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/usecase/get_task_usecase.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/add_task/add_task_presenter.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/edit_task/edit_task_presenter.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/get_task_presenter.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton(() => NavigationService());

  serviceLocator.registerFactory(() => GetTaskUsecase(serviceLocator()));

  serviceLocator.registerFactory(() => AddTaskUsecase(serviceLocator()));

  serviceLocator.registerFactory(() => EditTaskUsecase(serviceLocator()));

  serviceLocator.registerFactory(() => CheckLoginStatusUsecase(serviceLocator()));

  serviceLocator.registerFactory(() => SignInWithEmailAndPasswordUseCase(serviceLocator()));

  serviceLocator.registerFactory(() => SignUpWithEmailAndPasswordUseCase(serviceLocator()));

  serviceLocator.registerFactory(() => SignOutUseCase(serviceLocator()));

  serviceLocator.registerFactory(() => GetTaskPresenter(serviceLocator()));

  serviceLocator.registerFactory(() => AddTaskPresenter(serviceLocator()));

  serviceLocator.registerFactory(() => EditTaskPresenter(serviceLocator()));

  serviceLocator.registerFactory(() => SignInPresenter(serviceLocator()));

  serviceLocator.registerFactory(() => SignUpPresenter(serviceLocator()));

  serviceLocator.registerFactory(() => SplashScreenPresenter(serviceLocator()));

  serviceLocator.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl());

  serviceLocator.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl());
  
}

Future<void> reset() async {
  serviceLocator.resetLazySingleton<AuthenticationRepository>();
  serviceLocator.resetLazySingleton<TaskRepository>();
}