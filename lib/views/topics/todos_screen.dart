import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_getx/controllers/todos_controller.dart';

class TodosScreen extends StatelessWidget {
  TodosScreen({super.key});
  final controller = Get.find<ToDosController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///-----[AppBar]-----
        appBar: AppBar(
          title: Text('API Data Fetching ToDo',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green.shade900,
          centerTitle: true,
        ),

        ///-----[Body]-----
        body: controller.allTodo.isEmpty

            /// Show Indicator if allTodo is Empty
            ? Center(child: CircularProgressIndicator())

            /// Show ToDos Data Obx widget using Controller
            : Obx(
                () => ListView.builder(
                  itemCount: controller.allTodo.length,
                  itemBuilder: (context, index) {
                    final todo = controller.allTodo[index];
                    return Card(
                      child: ListTile(
                        leading:
                            CircleAvatar(child: Text(todo.id.toString())),
                        title: Text('title: ${todo.title}'),
                        subtitle: Text('status: ${todo.completed}'),
                        trailing: todo.completed == true ? Icon(Icons.check) : Icon(Icons.error_outline),
                      ),
                    );
                  },
                ),
              ));
  }
}
