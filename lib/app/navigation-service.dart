import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-in/view/sign_in_view.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/view/sign_up_view.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/add_task/view/add_task_view.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/edit_task/view/edit_task_view.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/view/get_task_view.dart';

class NavigationService{
  final GlobalKey <NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String homePageRoute = "/homepage";
  static const String signInPageRoute = "/sign_in_page";
  static const String signUpPageRoute = "/sign_up_page";
  static const String getTaskPageRoute = "/get_task_page";
  static const String addTaskPageRoute = "/add_task_page";
  static const String editTaskPageRoute = "/edit_task_page";

  static Route <dynamic> generateRoute (RouteSettings settings){
    switch (settings.name) {
      case homePageRoute : 
        return MaterialPageRoute(
          builder: (_) => GetTaskView(),
          settings: RouteSettings(
            name: NavigationService.homePageRoute,
          )
        );

      case signUpPageRoute:
        return MaterialPageRoute(
          builder: (_) => SignUpView(),
          settings: RouteSettings(
            name: NavigationService.signUpPageRoute
          )
        );

      case signInPageRoute:
        return MaterialPageRoute(
          builder: (_) => SignInView(),
          settings: RouteSettings(
            name: NavigationService.signInPageRoute,
          )
        );

      case addTaskPageRoute:
        return MaterialPageRoute(
          builder: (_) => AddTaskView(),
          settings: RouteSettings(
            name: NavigationService.addTaskPageRoute,
          )
        );
      
      case editTaskPageRoute:
        return MaterialPageRoute(
          builder: (_) => EditTaskView(settings.arguments! as EditTaskViewParams),
          settings: RouteSettings(
            name: NavigationService.editTaskPageRoute,
          )
        );
      default:
        throw Exception("NavigationService: Invalid Navigation");
    }
  }


  Future<void> navigateTo(String routeName, {bool shouldReplace=false, Object? arguments}){
    if (shouldReplace) {
      return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
    }
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }
  
  void navigateBack(){
    return navigatorKey.currentState!.pop();
  }

  void navigatePopUntil(String untilRoute){
    return navigatorKey.currentState!.popUntil(ModalRoute.withName('$untilRoute'));
  }
}