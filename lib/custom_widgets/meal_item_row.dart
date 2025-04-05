import 'package:flutter/material.dart';

class MealItemRow extends StatelessWidget {
  const MealItemRow({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        /// Icon
        Icon(icon, size: 16, color: Colors.white),

        /// Gap
        SizedBox(width: 8),

        /// Label
        Text(label, style: TextStyle(color: Colors.white))
      ],
    );
  }
}
