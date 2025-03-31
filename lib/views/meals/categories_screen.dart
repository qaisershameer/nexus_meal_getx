import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controllers/home_controller.dart';
import '../../custom_widgets/category_grid_item.dart';
import '../../models/meals_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final RxList<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    return GridView(
      padding: EdgeInsets.all(24.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (var category in controller.availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              final filteredMeals = controller.availableMeals
                  .where(
                    (meal) => meal.categories.contains(category.id),
                  )
                  .toList();
              // Get.to(Meal) /// Navigate to Meal Screen with these filter Meals in next lecture.
            },
          ),
      ],
    );
  }
}
