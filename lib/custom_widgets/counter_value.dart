import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.controller,
  });

  final CounterController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.counter.value < 0) {
          return Text(
            'Ahh Negative : ${controller.counter}',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.white),
          );
        } else if (controller.counter >= 5 && controller.counter <= 9) {
          return Text(
            'Burrraaah!!! : 0${controller.counter}',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.white),
          );
        } else if (controller.counter >= 10) {
          return Text(
            'Burrraaah!!! : ${controller.counter}',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.white),
          );
        } else {
          return Text(
            '*** 0${controller.counter} ***',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.white),
          );
        }
      },
    );
  }
}
