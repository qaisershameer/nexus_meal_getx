import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_getx/controllers/home_controller.dart';
import 'package:todo_getx/models/meals_model.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../custom_widgets/meal_title.dart';
import '../../custom_widgets/meal_sub_title.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    return Scaffold(

      ///-----[ AppBar ]-----
      appBar: AppBar(
        title: Text(meal.title),

        actions: [
          ///-----[IconButton * Favourite Button]-----
          IconButton(
              onPressed: () {

                /// Checking Food already Added || Not Added
                final wasAdded = controller.toggleMealFavouriteStatus(meal).value;

                /// SnackBar Status Message
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: wasAdded ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(milliseconds: 700),
                    content: Text(wasAdded
                        ? 'Meal Added as a Favourite'
                        : 'Meal Removed from Favourite List',
                    style: TextStyle(color: Colors.white),)));
              },

              ///-----[ Obx Widget ]-----
              icon: Obx(() => controller.favouriteMeals.contains(meal)
                  ? Icon(Icons.star)
                  : Icon(Icons.star_border)))
        ],
      ),

      ///-----[ Body ]-----
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Hero Animation
            Hero(
              tag: meal.id,

              /// FadeInImage with NetWork Image
              child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity),
            ),

            ///-----[ Ingredients Heading ]-----
            MealTitle(title: 'Ingredients'),

            ///-----[ Ingredients Details ]-----
            MealSubTitle(subtitle: meal.ingredients),

            ///-----[ Steps Heading ]-----
            MealTitle(title: 'Steps'),

            ///-----[ Steps Details ]-----
            MealSubTitle(subtitle: meal.steps, horizontal: 12.0, vertical: 8.0)

          ],
        ),
      ),
    );
  }
}
