import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_getx/views/topics/counter_screen.dart';

import '../controllers/home_controller.dart';
import '../custom_widgets/bottom_navigation_bar.dart';
import 'meals/categories_screen.dart';
import 'meals/favourite_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        Widget activeScreen = CategoriesScreen(availableMeals: controller.availableMeals,);
        var activePageTitle = 'Categories';
        if (controller.selectedPageIndex.value == 1) {
          activeScreen = FavouriteScreen();
          activePageTitle = "Your Favourites";
        } else if (controller.selectedPageIndex.value == 2) {
          activeScreen = CounterScreen();
          activePageTitle = "Get X Concepts";
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              activePageTitle,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue.shade800,
          ),
          body: activeScreen,
          bottomNavigationBar: UBottomNavigationBar(controller: controller),
        );
      },
    );
  }
}
