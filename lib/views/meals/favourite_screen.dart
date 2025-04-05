import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is Favourite Meals Screen\n*****\n****\n***\n**\n*',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 48, color: Colors.white),
        ),
      ),
    );
  }
}
