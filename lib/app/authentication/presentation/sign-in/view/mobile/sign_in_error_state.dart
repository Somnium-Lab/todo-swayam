import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-in/sign_in_controller.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-in/sign_in_state_machine.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-in/view/widget/sign_in_content_body.dart';

class SignInMobileErrorView extends StatefulWidget {
  final SignInController controller;
  final SignInErrorState errorState;


  const SignInMobileErrorView({Key? key, required this.errorState, required this.controller}) : super(key: key);

  @override
  _SignInMobileErrorViewState createState() => _SignInMobileErrorViewState();
}

class _SignInMobileErrorViewState extends State<SignInMobileErrorView> {

  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    _emailTextController = new TextEditingController(text: widget.errorState.email);
    _passwordTextController =
        new TextEditingController(text: widget.errorState.password);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SignInContentBody(
                  email: _emailTextController,
                  password: _passwordTextController,
                  controller: widget.controller),
              //Text(widget.errorState.errorMessage)
           
          );
  }
}