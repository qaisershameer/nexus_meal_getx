import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_getx/custom_widgets/meal_item.dart';
import 'package:todo_getx/models/meals_model.dart';
import 'package:todo_getx/views/meals/meal_detail_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Headline Error if nothing Found in Meals List
          Text('Uh No! nothing here',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface)
          ),

          /// Gap
          const SizedBox(height: 16),

          /// Body Content Message if nothing Found in Meals List
          Text('Try Selecting a different Category',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface)
          ),
        ],
      ),
    );

    /// Headline if meals list is not empty then display category wise meals with all its details
    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return MealItem(
              meal: meals[index],
              onSelectMeal: (meal) {
                /// Navigate to Meal Detail Screen
                Get.to(() => MealDetailScreen(meal: meal));
              },
            );
          });
    }

    /// if meal title is null then return above define content widget
    if (title == null) {
      return content;
    }

    /// AppBar & Content in Scaffold
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
