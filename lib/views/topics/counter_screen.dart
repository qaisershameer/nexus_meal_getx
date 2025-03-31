import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_getx/views/topics/todo_screen.dart';

import '../../controllers/counter_controller.dart';
import '../../controllers/getx_user_controller.dart';
import '../../custom_widgets/counter_buttons.dart';
import '../../custom_widgets/counter_value.dart';
import '../../custom_widgets/u_button_icon.dart';
import 'counter2_screen.dart';
import 'getx_user_profile.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});
  final controller = Get.put(CounterController());
  final userController = Get.put(GetXUserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// Gap
              SizedBox(
                height: 24.0,
              ),

              /// User Name Text from Get X User Controller Display User Name Obx Widget
              Obx(
                () {
                  return Text('Name: ${userController.name}',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),);
                },
              ),
          
              /// Gap
              SizedBox(
                height: 16.0,
              ),
          
              /// User Name Text from Get X User Controller Display User Name Obx Widget
              Obx(
                () {
                  return Text('Email: ${userController.email}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),);
                },
              ),
          
              /// Line Divider 01
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 24.0),
                child: Divider(
                  color: Colors.deepPurple.shade200,
                  thickness: 2.0,
                ),
              ),
          
              /// Title Text
              Text(
                'You have pressed this many times',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
              ),

              /// Gap
              SizedBox(height: 24.0,),

              /// Counter Text for Controller Counter Value Display Using/Wrapping Obx Widget
              Counter(controller: controller),

              /// Gap
              SizedBox(height: 24.0,),

              /// Counter Buttons
              CounterButtons(controller: controller),
          
              /// Line Divider 02
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 24.0),
                child: Divider(
                  color: Colors.orange.shade200,
                  thickness: 2.0,
                ),
              ),
          
              /// Navigate to Counter 2 Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(Counter2Screen()),
                  buttonText: 'Counter 2nd Screen',
                  buttonIcon: Icon(Icons.alarm_add,color: Colors.white,)),
          
              /// Gap
              SizedBox(
                height: 24.0,
              ),
          
              /// Assignment 01 Get X Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(GetxUserProfile()),
                  buttonText: 'GetX Assignment',
                  buttonIcon: Icon(Icons.task_alt, color: Colors.white,)),
          
              /// Gap
              SizedBox(
                height: 24.0,
              ),
          
              /// To-Do App Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(ToDoScreen()),
                  buttonText: 'To-Do. App Screen',
                  buttonIcon: Icon(Icons.alarm_add, color: Colors.white,)),
            ],
          ),
        ),
      ),
    );
  }
}

