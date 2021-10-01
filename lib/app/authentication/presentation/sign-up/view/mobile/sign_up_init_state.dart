import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/sign_up_controller.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/view/widget/sign_up_body_content.dart';

class SignUpInitMobileView extends StatefulWidget {
  final SignUpController controller;

  const SignUpInitMobileView({Key? key, required this.controller}) : super(key: key);

  @override
  _SignUpInitMobileViewState createState() => _SignUpInitMobileViewState();
}

class _SignUpInitMobileViewState extends State<SignUpInitMobileView> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _nameTextController;

  @override
  void initState() {
    _emailTextController = new TextEditingController();
    _passwordTextController = new TextEditingController();
    _nameTextController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: SignUpContentBody(
                name: _nameTextController,
                email: _emailTextController,
                password: _passwordTextController,
                controller: widget.controller)));
  }
}
