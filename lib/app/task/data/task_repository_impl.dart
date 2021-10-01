import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/entity/task_entity.dart';
import 'package:flutter_todo_clean_arch/app/task/domain/repository/task_repository.dart';
import 'package:flutter_todo_clean_arch/core/utility/firebase_keys.dart';

class TaskRepositoryImpl implements TaskRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User getUser() {
    if (_auth.currentUser != null) {
      return _auth.currentUser!;
    } else {
      throw ('User : Null : TaskRepoImpl');
    }
  }

  @override
  Future<void> addTask(
      {required String title, required String description}) async {
    User user = getUser();

    await _firestore
        .collection(FirebaseKeys.collectionNameUsers).doc(user.uid).collection(FirebaseKeys.collectionNameTasks).add({
      FirebaseKeys.keyNameTitle: title,
      FirebaseKeys.keyNameDescription: description,
      FirebaseKeys.keyNameTime: DateTime.now(),
    });
  }

  @override
  Future<void> editTask({
    required String title,
    required String description,
    required String itemId,
  }) async {
    User user = getUser();

    await _firestore
        .collection(FirebaseKeys.collectionNameUsers)
        .doc(user.uid)
        .collection(FirebaseKeys.collectionNameTasks)
        .doc(itemId)
        .set({
      FirebaseKeys.keyNameTitle: title,
      FirebaseKeys.keyNameDescription: description,
    }, SetOptions(merge: true));
  }

  @override
  Future<List<TaskEntity>> getTask() async {
    User user = getUser();
    print(user.displayName);
    List<TaskEntity> tasklist = [];

    QuerySnapshot querySnapshot = await _firestore
        .collection(FirebaseKeys.collectionNameUsers)
        .doc(user.uid)
        .collection(FirebaseKeys.collectionNameTasks)
        .get();

    for (var i = 0; i < querySnapshot.docs.length; i++) {
      tasklist.add(new TaskEntity(
          title: querySnapshot.docs[i][FirebaseKeys.keyNameTitle],
          description: querySnapshot.docs[i][FirebaseKeys.keyNameDescription],
          tskId: querySnapshot.docs[i].id,
          time: (querySnapshot.docs[i][FirebaseKeys.keyNameTime] as Timestamp)
              .toDate()));
    }
    print("Task List : $tasklist");
    return tasklist;
  }
}