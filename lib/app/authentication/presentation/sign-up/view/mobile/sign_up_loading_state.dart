import 'package:flutter/material.dart';

class SignUpMobileLoadingView extends StatelessWidget {
  const SignUpMobileLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}