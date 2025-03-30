import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import 'counter_screen.dart';

class ToDoScreen extends StatelessWidget {
  ToDoScreen({super.key});
  final controller = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Get X Todo App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () => Get.to(CounterScreen()),
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body: Obx(
        () => ListView.separated(
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            final data = controller.data[index];
            return ListTile(

              /// display task title
              title: Text(data['title'] ?? ''),

              /// display task description
              subtitle: Text(data['description'] ?? ''),

              /// edit task title & description
              leading: IconButton( icon: Icon(Icons.edit_calendar_outlined, color: Colors.green,), onPressed: () => controller.showEditDialog(index),), // Open edit dialog,

              /// delete task title & description
              trailing: IconButton(onPressed: () => controller.deleteData(index), icon: Icon(Icons.delete_forever_sharp, color: Colors.red,),),

            );
          },
          separatorBuilder: (context, index) => Divider(
            color: Colors.deepPurple.shade200,
            thickness: 3,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.showBottomSheet();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
