import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_getx/controllers/home_controller.dart';
import 'package:todo_getx/custom_widgets/meal_item.dart';
import 'package:todo_getx/models/meals_model.dart';
import 'package:todo_getx/views/meals/meal_detail_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    final List<Meal> favouriteMeals = controller.favouriteMeals;

    ///-----[ Content ]-----
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// Headline Error if nothing Found in Meals List
          Text('Uh No! nothing here',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface)),
          /// Gap
          const SizedBox(height: 16),
          /// Body Content Message if nothing Found in Meals List
          Text('Mark some Meals as a Favourite',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface)),
        ],
      ),
    );

    /// Headline if meals list is not empty then display category wise meals with all its details
    if (favouriteMeals.isNotEmpty) {
      content = Obx(
          () => ListView.builder(
            itemCount: favouriteMeals.length,
            itemBuilder: (context, index) {
              return MealItem(
                meal: favouriteMeals[index],
                onSelectMeal: (meal) {
                  /// Navigate to Meal Detail Screen
                  Get.to(() => MealDetailScreen(meal: meal));
                },
              );
            }),
      );
    }

    /// if meal title is null then return above define content widget
    if (title == null) return content;

    /// AppBar & Content in Scaffold
    return Scaffold(
      ///-----[ AppBar ]-----
      appBar: AppBar(title: Text(title!)),

      ///-----[ Body ]-----
      body: content,
    );
  }
}
