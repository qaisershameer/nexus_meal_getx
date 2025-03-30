import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../custom_widgets/u_button_icon.dart';

class ToDoController extends GetxController {
  static ToDoController get instance => Get.find();

  /// Variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _description = TextEditingController();
  RxList data = [].obs;

  /// Functions /// Screen Logics

  /// Show Bottom Sheet For Add New Map Data
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
                      hintText: 'Enter Task Title', border: OutlineInputBorder()),
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
                      hintText: 'Enter Task Description',
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
                UButtonIcon(
                  myOnPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addData();
                    }
                  },
                  buttonText: 'Save Task Data',
                  buttonIcon: Icon(Icons.save),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Show Bottom Sheet For Edit Map Data
  void showEditDialog(int index) {
    // Fill text controllers with existing data
    _title.text = data[index]['title'];
    _description.text = data[index]['description'];

    // Show dialog for editing
    Get.defaultDialog(
      title: "Edit Task",
      content: Form(
        key: _formKey,
        child: Column(
          children: [

            /// Task Title Edit
            TextFormField(
              controller: _title,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
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

            /// Description Edit
            TextFormField(
              controller: _description,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This Field is required.';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      textConfirm: "Save",
      textCancel: "Cancel",
      confirmTextColor: Colors.white,
      onConfirm: () {
        if (_formKey.currentState!.validate()) {
          editData(index, _title.text, _description.text);
        }

        /// Clear Text Controllers
        _title.clear();
        _description.clear();

        /// Route Get Back Page
        Get.back(); // Close dialog
      },

    );
  }

  /// Function Add Data in Map
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

  /// Function Edit Data in Map
  void editData(int index, String newTitle, String newDescription) {
    if (index >= 0 && index < data.length) {
      data[index] = {
        'title': newTitle,
        'description': newDescription,
      };
      data.refresh(); // Notify UI about the change
      showSnackBar('Data Updated Successfully');
    }
  }

  /// Function Delete Data in Map
  void deleteData(int index) {
    Get.defaultDialog(
      title: "Delete Confirmation",
      middleText: "Are you sure you want to delete this item?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        if (index >= 0 && index < data.length) {
          data.removeAt(index);
          showSnackBar('Data Deleted Successfully');
        }
        Get.back(); // Close dialog
      },
      onCancel: () {}, // Close dialog when "No" is pressed
    );
  }


  /// function to add SnackBar message
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
