import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';

class UBottomNavigationBar extends StatelessWidget {
  const UBottomNavigationBar({super.key, required this.controller});

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

        onTap: controller.selectPage,
        currentIndex: controller.selectedPageIndex.value,

        /// Pages List
        items: [

          /// Page 01 Categories
          BottomNavigationBarItem(label: 'Categories', icon: Icon(Icons.set_meal)),

          /// Page 02 Favourites
          BottomNavigationBarItem(label: 'Favourites', icon: Icon(Icons.star)),

          /// Page 03 Settings
          BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),

        ]);
  }
}
