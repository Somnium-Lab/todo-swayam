import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/get_task_controller.dart';
import 'package:flutter_todo_clean_arch/app/task/presentation/get_task/get_task_state_machine.dart';


class GetTaskContentBody extends StatelessWidget {
  final GetTaskController getTaskController;

  final GetTaskInitializedState getTaskInitializedState;

  const GetTaskContentBody({
    Key? key,
    required this.getTaskController,
    required this.getTaskInitializedState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Todos"),
        
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              for (var i = 0; i < getTaskInitializedState.taskList.length; i++)
                GestureDetector(
                  child: Container(
                    child: ListTile(
                      title: Text(
                        '${getTaskInitializedState.taskList[i].title}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          ),
                        ),
                      subtitle: Text(
                        '${getTaskInitializedState.taskList[i].description}',
                        style: TextStyle(
                          fontSize: 14,
                          ),
                        ),
                      trailing: IconButton(
                         onPressed: (){
                           getTaskController.navigateToEditPage(
                           task: getTaskInitializedState.taskList[i]);
                         }, 
                         icon: Icon(Icons.edit),
                         ),
                        
                      ),
                  ),
                  )
            ],
          ),
        ),
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: () {
          getTaskController.navigateToAddPage();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}