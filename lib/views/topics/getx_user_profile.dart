import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controllers/getx_user_controller.dart';
import '../../custom_widgets/u_button_icon.dart';
import '../home_screen.dart';


class GetxUserProfile extends StatelessWidget {
  GetxUserProfile({super.key});
  final GetXUserController controller = Get.find<GetXUserController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Variables - TextEditingController
  final _name = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Get X Assignment 01',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade800,
        actions: [
          IconButton(
            onPressed: () => Get.to(HomeScreen()),
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// User Name
              TextFormField(
                controller: _name,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Enter User Name', border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This Field is required.';
                  }
                  return null;
                },
              ),

              /// Gap
              SizedBox(
                height: 16.0,
              ),

              /// User Email
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Enter User Email', border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This Field is required.';
                  }
                  return null;
                },
              ),

              /// Gap
              SizedBox(
                height: 16.0,
              ),

              /// Save Button to Add User Name & Password Values in Controller
              UButtonIcon(
                  myOnPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.updateProfile(_name.text, _email.text);
                    }
                  },
                  buttonText: 'Save User Profile',
                  buttonIcon: Icon(Icons.save, color: Colors.white,),),
            ],
          ),
        ),
      ),
    );
  }
}
