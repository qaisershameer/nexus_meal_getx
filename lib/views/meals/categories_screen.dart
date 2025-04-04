import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_getx/views/meals/meals_screen.dart';
import '../../controllers/home_controller.dart';
import '../../custom_widgets/category_grid_item.dart';
import '../../models/meals_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final RxList<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<HomeScreenController>();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    /// Animation Builder for Categories on Screen Load
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: EdgeInsets.all(24.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),

        /// Category List Display via loop and generate Category Wise Filtered Meals List
        children: [
          for (var category in controller.availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                final filteredMeals = controller.availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
                /// Navigate to Meal Screen with these above Selected Category Wise filter Meals
                Get.to(()=> MealsScreen(meals: filteredMeals));
              },
            ),
        ],
      ),

      /// Animation Effect define here.
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: Offset(0, 0.3),
          end: Offset(0, 0),
        ).animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOut)),
        child: child,
      ),
    );
  }
}
