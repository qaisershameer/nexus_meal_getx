import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDoController extends GetxController {
  static ToDoController get instance => Get.find();

  /// Variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _description = TextEditingController();
  RxList data = [].obs;

  /// Functions /// Screen Logics

  /// Show Bottom Sheet
  Future<void> showBottomSheet() async {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// Title
                TextFormField(
                  controller: _title,
                  decoration: InputDecoration(
                      hintText: 'Enter Title', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This Field is required.';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This Field is required.';
                    }
                    return null;
                  },
                ),

                /// Gap
                SizedBox(
                  height: 16.0,
                ),

                /// Add Button to Add Data
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addData();
                      }
                    },
                    child: Text('Add Data'))
              ],
            ),
          ),
        );
      },
    );
  }

  /// Function add Data in Map
  void addData() {
    Map<String, String> map = {
      'title': _title.text,
      'description': _description.text,
    };

    /// Data Add in Map
    data.add(map);

    /// Clear Text Controllers
    _title.clear();
    _description.clear();

    Get.back();

    /// show SnackBar Message
    showSnackBar('New Data Added Successfully');
  }

  // function to add SnackBar message
  void showSnackBar(String message) {
    final context = Get.context!;
    // Message Show in Status Bar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 500),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Text(message),
      ),
    );
  }
}
