import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/splash_screen/splash_screen_controller.dart';

class SplashScreenWidget extends StatelessWidget {
  final SplashScreenController controller;

  const SplashScreenWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.checkUserSignIn();
    return Scaffold(
        body: Center(
      child: Icon(Icons.star_border)
    ));
  }
}