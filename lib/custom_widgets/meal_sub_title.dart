import 'package:flutter/material.dart';

class MealSubTitle extends StatelessWidget {
  const MealSubTitle({super.key, required this.subtitle});

  final List<String> subtitle; // Change subtitle to List<String>

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: subtitle
            .map((item) => Text(
          item,

          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            height: 1.5
          ),
        ))
            .toList(),
      ),
    );
  }
}