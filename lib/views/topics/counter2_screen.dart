import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_getx/views/home_screen.dart';

import '../../controllers/counter_controller.dart';
import '../../custom_widgets/counter_buttons.dart';
import '../../custom_widgets/counter_value.dart';
import '../../custom_widgets/u_button_icon.dart';

class Counter2Screen extends StatelessWidget {
  Counter2Screen({super.key});
  final controller = Get.find<CounterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Get X Concepts Counter2', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue.shade800,
        actions: [
          IconButton(
            onPressed: () => Get.to(HomeScreen()),
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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

            /// Line Divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 24.0),
              child: Divider(
                color: Colors.green,
                thickness: 2.0,
              ),
            ),

            /// Navigate to Counter 1 Main Home Screen
            UButtonIcon(
                myOnPressed: () => Get.to(HomeScreen()),
                buttonText: 'Counter Home Screen',
                buttonIcon: Icon(Icons.home, color: Colors.white,)),
          ],
        ),
      ),
    );
  }
}

