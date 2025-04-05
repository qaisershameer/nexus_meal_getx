import 'package:flutter/material.dart';
import 'package:todo_getx/models/meals_model.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../custom_widgets/meal_heading.dart';
import '../../custom_widgets/meal_sub_title.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.star_border))],
      ),
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

            /// Ingredients
            MealTitle(title: 'Ingredients'),
            MealSubTitle(subtitle: meal.ingredients),

            /// Steps
            MealTitle(title: 'Steps'),
            MealSubTitle(subtitle: meal.steps),
          ],
        ),
      ),
    );
  }
}
