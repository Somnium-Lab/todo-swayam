import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/navigation-service.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/add_task/add_task_controller.dart';
import 'package:flutter_todo_clean_arch/injection-container.dart';

class AddTaskContentBody extends StatelessWidget {
  
  const AddTaskContentBody(
      {Key? key,required this.addTaskController,required this.title,required this.description})
      : super(key: key);
  final AddTaskController addTaskController;
  final TextEditingController title;
  final TextEditingController description;

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = serviceLocator<NavigationService>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Add a New Task"),
      ),
      body: SingleChildScrollView(
              child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                child: titleField("Add Task Title", title),
              ),
              SizedBox(height: 20),
              Container(
                child: taskField("Task Description...", description),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  ElevatedButton(
                    onPressed: () {
                      _navigationService.navigateTo(NavigationService.homePageRoute,
              shouldReplace: true);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey
                    ),
                     child: Text("Cancel")
                     ),
                  
                  SizedBox(width: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue
                    ),
                    onPressed: () {
                      addTaskController.addTask(title: title.text, description: description.text);
                     },
                     child: Text("Save")
                     ),
                ],
              )
            ],
            
          ),
        ),
      ),
      
    );
  }

  titleField(
      String hintText, TextEditingController cont) {
    return Container(
      height: 50,
      width: 320,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  taskField(
      String hintText, TextEditingController cont) {
    return Container(
      height: 300,
      width: 320,
      child: TextField(
        controller: cont,
        maxLines: 500,
        minLines: 12,
        decoration: InputDecoration(
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