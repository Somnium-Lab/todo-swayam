import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo_clean_arch/app/authentication/domain/repository/authentication_repository.dart';
import 'package:flutter_todo_clean_arch/core/utility/firebase_keys.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);

  }

  @override 
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override 
  Future<void> signUpWithEmailAndPassword({required name, required String email, required String password}) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);

    await _firestore.collection(FirebaseKeys.collectionNameUsers).doc(_auth.currentUser?.uid).set({
      FirebaseKeys.userName: name,
      FirebaseKeys.userEmail: email,
    });

  }

  @override
  bool checkLoginStatus(){
    if (_auth.currentUser == null){
       return false;
    }
    else{
      return true;
    }
  }

}