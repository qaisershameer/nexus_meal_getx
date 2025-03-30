import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';
import '../screens/counter_screen.dart';
import '../custom_widgets/u_button_icon.dart';

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
            onPressed: () => Get.to(CounterScreen()),
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
      backgroundColor: Colors.blue.shade100,
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
                UButtonIcon(
                    myOnPressed: () => controller.increment(),
                    buttonText: 'Increment',
                    buttonIcon: Icon(Icons.add_circle_outline),),

                /// Gap
                SizedBox(
                  width: 24.0,
                ),

                /// decrement counter controller value
                UButtonIcon(
                    myOnPressed: () => controller.decrement(),
                    buttonText: 'Decrement',
                    buttonIcon: Icon(Icons.remove_circle_outline),),
              ],
            ),

            /// Line Divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
              child: Divider(
                color: Colors.green,
                thickness: 2.0,
              ),
            ),

            /// Navigate to Counter 1 Main Home Screen
            UButtonIcon(
                myOnPressed: () => Get.to(CounterScreen()),
                buttonText: 'Counter Home Screen',
                buttonIcon: Icon(Icons.home)),
          ],
        ),
      ),
    );
  }
}
