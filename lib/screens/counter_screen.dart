import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/counter_controller.dart';
import 'package:todo_getx/screens/counter2_screen.dart';
import 'package:todo_getx/screens/todo_screen.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});
  final controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Concepts'),
        backgroundColor: Colors.blue.shade800,
      ),
      backgroundColor: Colors.blue.shade500,
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                FilledButton(
                  onPressed: () => controller.increment(),
                  child: Text('Increment'),
                ),

                /// Gap
                SizedBox(
                  width: 16.0,
                ),

                /// decrement counter controller value
                FilledButton(
                  onPressed: () => controller.decrement(),
                  child: Text('Decrement'),
                ),
              ],
            ),

            /// Navigate to another Screen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Second Counter Screen
                FilledButton(
                  onPressed: () => Get.to(Counter2Screen()),
                  child: Text('Counter 2nd Screen'),
                ),

                /// Gap
                SizedBox(
                  width: 16.0,
                ),

                /// To-Do App Screen
                FilledButton(
                  onPressed: () => Get.to(ToDoScreen()),
                  child: Text('ToDo Screen'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
