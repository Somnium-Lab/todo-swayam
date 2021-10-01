import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-up/sign_up_controller.dart';
import 'package:flutter_todo_clean_arch/app/navigation-service.dart';
import 'package:flutter_todo_clean_arch/injection-container.dart';

class SignUpContentBody extends StatelessWidget {
  const SignUpContentBody({ Key? key, required this.name,required this.email,required this.password, required this.controller }) : super(key: key);

  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController password;
  final SignUpController controller;
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0,),
      body: SingleChildScrollView(
          child: Center(
            child: Column(
                  children: [
                    SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                        "Sign Up to Get Started!",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: field("Name", Icons.account_box, name),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: field("email", Icons.mail, email),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: field("password", Icons.lock, password),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    customButton(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () =>  serviceLocator<NavigationService>().navigateTo(
                                NavigationService.signInPageRoute,
                                shouldReplace: true,
                          ),
                        child: Text(
                          "Already a User? Sign In",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
          ),
      ),
    );
  }

  Widget customButton() {
    return GestureDetector(
      onTap: () {
        if (name.text.isNotEmpty && email.text.isNotEmpty && password.text.isNotEmpty) {
            this.controller.signUpWithEmailAndPassword(
              name: name.text, 
              email: email.text, 
              password: password.text
            );
        }
      },
      child: Container(
          height: 45,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          alignment: Alignment.center,
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget field(
      String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: 50,
      width: 320,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}


