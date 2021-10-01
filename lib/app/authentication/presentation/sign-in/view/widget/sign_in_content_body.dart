import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/authentication/presentation/sign-in/sign_in_controller.dart';
import 'package:flutter_todo_clean_arch/app/navigation-service.dart';
import 'package:flutter_todo_clean_arch/injection-container.dart';

class SignInContentBody extends StatelessWidget {
  const SignInContentBody({ Key? key, required this.email,required this.password, required this.controller }) : super(key: key);

  final TextEditingController email;
  final TextEditingController password;
  final SignInController controller;
  

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
                        "Sign In to Contiue!",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: emailField("email", Icons.mail, email),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: passField("password", Icons.lock, password),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  customButton(),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => serviceLocator<NavigationService>().navigateTo(
                      NavigationService.signUpPageRoute,
                      ),
                    child: Text(
                      "Not a User? Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
      ), 
      ),     
       );
  }

  customButton() {
    return GestureDetector(
      onTap: () {
        if (email.text.isNotEmpty && password.text.isNotEmpty) {
          this.controller.signInWithEmailAndPassword(email: email.text, password: password.text);
        }
      },
      child: Container(
          height: 45.0,
          width: 250.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          alignment: Alignment.center,
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

   emailField(
      String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height:  50,
      width:  320,
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

  passField(
      String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: 50,
      width: 320,
      child: TextField(
        obscureText: true,
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