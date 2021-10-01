import 'dart:async';

abstract class AuthenticationRepository{
    Future<void> signInWithEmailAndPassword({required String email, required String password});

    Future<void> signOut();

    Future<void> signUpWithEmailAndPassword({required name, required String email, required String password});

    bool checkLoginStatus();
}