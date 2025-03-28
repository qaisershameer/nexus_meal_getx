import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  /// Variables
  final _title = TextEditingController();
  final _description = TextEditingController();
  RxList data = [].obs;

  /// Functions

  /// Show Bottom Sheet
  Future<void> showBottomSheet() async {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              /// Title
              TextFormField(
                controller: _title,
                decoration: InputDecoration(
                    hintText: 'Enter Title', border: OutlineInputBorder()),
              ),

              /// Gap
              SizedBox(
                height: 16.0,
              ),

              /// Description
              TextFormField(
                controller: _description,
                decoration: InputDecoration(
                    hintText: 'Enter Description',
                    border: OutlineInputBorder()),
              ),

              /// Gap
              SizedBox(
                height: 16.0,
              ),

              /// Add Button to Add Data
              ElevatedButton(
                  onPressed: () => addData(), child: Text('Add Data'))
            ],
          ),
        );
      },
    );
  }

  /// Add Data
  void addData() {
    Map<String, String> map = {
      'title': _title.text,
      'description': _description.text,
    };

    data.add(map);
  }
}
