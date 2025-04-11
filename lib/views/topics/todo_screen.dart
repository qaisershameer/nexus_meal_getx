import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controllers/todo_controller.dart';
import '../home_screen.dart';

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
        backgroundColor: Colors.blue.shade800,
        actions: [
          IconButton(
            onPressed: () => Get.to(HomeScreen()),
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Colors.white),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            final data = controller.data[index];
            return ListTile(

              /// display task title
              title: Text(data['title'] ?? '', style: TextStyle(color: Colors.white),),

              /// display task description
              subtitle: Text(data['description'] ?? '', style: TextStyle(color: Colors.grey),),

              /// edit task title & description
              leading: IconButton( icon: Icon(Icons.edit_calendar_outlined, color: Colors.green.shade500,), onPressed: () => controller.showEditDialog(index),), // Open edit dialog,

              /// delete task title & description
              trailing: IconButton(onPressed: () => controller.deleteData(index), icon: Icon(Icons.delete_forever_sharp, color: Colors.red.shade500,),),

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
