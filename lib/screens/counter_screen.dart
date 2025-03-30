import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';
import '../controllers/getx_user_controller.dart';
import '../custom_widgets/u_button_icon.dart';
import '../screens/counter2_screen.dart';
import '../screens/getx_user_profile.dart';
import '../screens/todo_screen.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});
  final controller = Get.put(CounterController());
  final userController = Get.put(GetXUserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Get X Concepts', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue.shade800,
      ),
      backgroundColor: Colors.blue.shade50,
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
                      style: Theme.of(context).textTheme.headlineSmall);
                },
              ),
          
              /// Gap
              SizedBox(
                height: 24.0,
              ),
          
              /// User Name Text from Get X User Controller Display User Name Obx Widget
              Obx(
                () {
                  return Text('Email: ${userController.email}',
                      style: Theme.of(context).textTheme.titleMedium);
                },
              ),
          
              /// Line Divider 01
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
                child: Divider(
                  color: Colors.deepPurple.shade200,
                  thickness: 2.0,
                ),
              ),
          
              /// Title Text
              Text(
                'You have pressed this many times',
                style: Theme.of(context).textTheme.titleLarge,
              ),
          
              /// Counter Text for Controller Counter Value Display Using/Wrapping Obx Widget
              Obx(
                () {
                  if (controller.counter.value < 0) {
                    return Text('Ahh Negative: ${controller.counter}',
                        style: Theme.of(context).textTheme.headlineLarge);
                  } else if (controller.counter > 5) {
                    return Text('Burrraaah!!!: ${controller.counter}',
                        style: Theme.of(context).textTheme.headlineLarge);
                  } else {
                    return Text('${controller.counter}',
                        style: Theme.of(context).textTheme.headlineLarge);
                  }
                },
              ),
          
              /// Counter Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// increment counter controller value
                  UButtonIcon(
                      myOnPressed: () => controller.increment(),
                      buttonText: 'Increment',
                      buttonIcon: Icon(Icons.add_circle_outline)),
          
                  /// Gap
                  SizedBox(
                    width: 24.0,
                  ),
          
                  /// decrement counter controller value
                  UButtonIcon(
                      myOnPressed: () => controller.decrement(),
                      buttonText: 'Decrement',
                      buttonIcon: Icon(Icons.remove_circle_outline)),
                ],
              ),
          
              /// Line Divider 02
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
                child: Divider(
                  color: Colors.orange.shade200,
                  thickness: 2.0,
                ),
              ),
          
              /// Navigate to Counter 2 Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(Counter2Screen()),
                  buttonText: 'Counter 2nd Screen',
                  buttonIcon: Icon(Icons.alarm_add)),
          
              /// Gap
              SizedBox(
                height: 24.0,
              ),
          
              /// Assignment 01 Get X Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(GetxAssignment()),
                  buttonText: 'GetX Assignment 01',
                  buttonIcon: Icon(Icons.task_alt)),
          
              /// Gap
              SizedBox(
                height: 24.0,
              ),
          
              /// To-Do App Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(ToDoScreen()),
                  buttonText: 'ToDo App Screen',
                  buttonIcon: Icon(Icons.alarm_add)),
            ],
          ),
        ),
      ),
    );
  }
}
