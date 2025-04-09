import 'package:flutter/material.dart';

class MealSubTitle extends StatelessWidget {
  const MealSubTitle(
      {super.key,
      required this.subtitle,
      this.horizontal = 2.0,
      this.vertical = 2.0});

  final List<String> subtitle; // Change subtitle to List<String>
  final double horizontal;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: subtitle
            .map(
              (content) => Padding(
                /// Padding
                padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),

                /// Content || Description || Details || Sub-Title
                child: Text(
                    content,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface)
                ),
              ),
            ).toList(),
      ),
    );
  }
}
