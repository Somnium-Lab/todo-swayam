import 'package:flutter/material.dart';

class LoadingStateMobileView extends StatefulWidget {

  const LoadingStateMobileView({Key? key,})
      : super(key: key);

  @override
  _LoadingStateMobileViewState createState() => _LoadingStateMobileViewState();
}

class _LoadingStateMobileViewState extends State<LoadingStateMobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}