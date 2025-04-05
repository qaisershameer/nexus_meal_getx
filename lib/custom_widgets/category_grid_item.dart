import 'package:flutter/material.dart';
import 'package:todo_getx/models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      child: Container(

        /// Container Decoration
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(71),
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.55),
              category.color.withValues(alpha: 0.90),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        /// Category Stack
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [

            /// Category Image
            Positioned(
              right: -30,
              top: -15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Image.asset(
                  category.image,
                  width: 70,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// Category Title
            Positioned(
              bottom: 1,
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
