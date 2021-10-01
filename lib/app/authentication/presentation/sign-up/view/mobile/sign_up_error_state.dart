import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/sign_up_controller.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/sign_up_state_machine.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/view/widget/sign_up_body_content.dart';

class SignUpMobileErrorView extends StatefulWidget {
  final SignUpController controller;
  final SignUpErrorState errorState;
  const SignUpMobileErrorView({Key? key, required this.errorState, required this.controller})
      : super(key: key);

  @override
  _SignUpMobileErrorViewState createState() => _SignUpMobileErrorViewState();
}

class _SignUpMobileErrorViewState extends State<SignUpMobileErrorView> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _nameTextController;

  @override
  void initState() {
    _emailTextController = new TextEditingController(text: widget.errorState.email);
    _passwordTextController =
        new TextEditingController(text: widget.errorState.password);
    _nameTextController = new TextEditingController(text: widget.errorState.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SignUpContentBody(

                  email: _emailTextController,
                  password: _passwordTextController,
                  name: _nameTextController,
                  controller: widget.controller),
              // Text(widget.errorState.errorMessage)
            
          ),
        );
  }
}