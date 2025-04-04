import 'package:flutter/material.dart';
import 'package:todo_getx/models/meals_model.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.star))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: meal.id,
                child: Image.network(meal.imageUrl,
                    height: 300, width: double.infinity, fit: BoxFit.cover))
          ],
        ),
      ),
    );
  }
}
