import 'package:flutter/material.dart';
class MealHeading extends StatelessWidget {
  const MealHeading({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Theme.of(context).colorScheme.onSurface));
  }
}