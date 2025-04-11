import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_getx/const/const.dart';
import '../models/todo_model.dart';

class ToDosController extends GetxController {
  static ToDosController get instance => Get.find();

  /// Variables
  List<dynamic> data = [];
  RxList<ToDos> allTodo = <ToDos>[].obs;
  RxList<ToDos> completedToDo = <ToDos>[].obs;
  RxList<ToDos> userWiseToDo = <ToDos>[].obs;
  RxList<ToDos> userWiseCompletedToDo = <ToDos>[].obs;

  /// todos initialized
  @override
  void onInit() {
    fetchToDos();
    super.onInit();
  }

  /// Functions /// Screen Logics
  Future<void> fetchToDos() async {
    try {
      /// URL
      Uri url = UConst.todoUrl;

      /// get response from URL
      final response = await http.get(url);

      /// response Output Checking
      if (response.statusCode == 200) {

        /// +ve response successful action
        data = jsonDecode(response.body);

        /// all Todos value assign from fetched data
        allTodo.value = data.map((json) => ToDos.fromJson(json)).toList();

        /// completed Todos value assign from all todos
        completedToDo.value = completedToDo.where((m) => m.completed == true).toList();

        /// completed Todos value assign from all todos
        userWiseToDo.value = userWiseToDo.where((m) => m.userId == true).toList();

        showSnackBar('Data successfully loaded: ${response.statusCode}', true);

      } else {

        /// -ve response error action
        showSnackBar('Something went wrong: ${response.statusCode}', false);

      }
    } catch (e) {

      /// URL Error action
      showSnackBar('Error: $e', false);

    }
  }

  /// function to add SnackBar message
  void showSnackBar(String message, bool isOk) {
    final context = Get.context!;
    // Message Show in Status Bar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 800),
        behavior: SnackBarBehavior.floating,
        backgroundColor: isOk ? Colors.green : Colors.red,
        content: Text(message, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
