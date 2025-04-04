import 'package:flutter/material.dart';
import 'package:todo_getx/custom_widgets/meal_item_row.dart';
import 'package:todo_getx/models/meals_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () => onSelectMeal(meal),
        child: Stack(
          children: [
            /// Hero Widget added here of Hero Animation.
            Hero(
              tag: meal.id,

              /// NetWork Image with FadeInImage
              child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity),
            ),

            /// Container with Meal Detail
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 30.0),
                child: Column(
                  children: [
                    /// Meal Title
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),

                    /// Gap
                    SizedBox(height: 12.0),

                    /// Row with Duration, Complexity, Affordability
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Duration
                        MealItemRow(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),

                        /// Gap
                        SizedBox(width: 12.0),

                        /// Complexity
                        MealItemRow(
                            icon: Icons.work,
                            label: meal.complexity.name.toString().toUpperCase()),

                        /// Gap
                        SizedBox(width: 12.0),

                        /// Affordability
                        MealItemRow(
                            icon: Icons.attach_money,
                            label: meal.affordability.name.toString().toUpperCase())
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
