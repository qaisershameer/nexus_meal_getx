import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo App Get-X',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            final data = controller.data[index];
            return ListTile(
              title: Text(data['title'] ?? ''),
              subtitle: Text(data['description'] ?? ''),
              leading: const Icon(Icons.edit_calendar_outlined),
              trailing: const Icon(Icons.settings),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            color: Colors.red,
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
