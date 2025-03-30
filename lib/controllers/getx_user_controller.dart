import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GetXUserController extends GetxController{
  /// Variables
  RxString name = ''.obs;
  RxString email = ''.obs;


/// Functions /// State Logics
  void updateProfile(String userName, String userEmail){

    /// Update Get X Variables Values
    name.value = userName;
    email.value = userEmail;

    /// show SnackBar Message
    showSnackBar("User Profile updated successfully!");

    /// Route Get Back Page
    Get.back(); // Close dialog
  }

  /// function to add SnackBar message
  void showSnackBar(String message) {
    final context = Get.context!;
    // Message Show in Status Bar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 200),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Text(message),
      ),
    );
  }
}