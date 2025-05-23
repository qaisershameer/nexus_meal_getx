import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CounterController extends GetxController {
  /// Variables
  RxInt counter = 0.obs;

  /// Functions /// State Logics
  void increment() {
    counter.value++;

    /// show SnackBar Message
    showSnackBar('Counter Incremented: ${counter.value}', 0);
  }

  void decrement() {
    counter.value--;

    /// show SnackBar Message
    showSnackBar('Counter Decremented: ${counter.value}', 1);
  }

  /// function to add SnackBar message
  void showSnackBar(String message, int value) {
    final context = Get.context!;
    // Message Show in Status Bar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 200),
        behavior: SnackBarBehavior.floating,
        backgroundColor: value == 0 ? Colors.green : Colors.red,
        content: Text(message),
      ),
    );
  }
}
