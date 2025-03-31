import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';
import 'u_button_icon.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({
    super.key,
    required this.controller,
  });

  final CounterController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// decrement counter controller value
        UButtonIcon(
            myOnPressed: () => controller.decrement(),
            buttonText: 'Decrement',
            buttonIcon: Icon(
              Icons.remove_circle_outline,
              color: Colors.white,
            )),

        /// Gap
        SizedBox(
          width: 48.0,
        ),

        /// increment counter controller value
        UButtonIcon(
            myOnPressed: () => controller.increment(),
            buttonText: 'Increment',
            buttonIcon: Icon(
              Icons.add_circle_outline,
              color: Colors.white,
            )),
      ],
    );
  }
}
