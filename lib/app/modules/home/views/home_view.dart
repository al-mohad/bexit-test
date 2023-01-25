import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() => controller.screens.elementAt(controller.currentIndex)),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              selectedItemColor: Colors.white,
              onTap: controller.changeScreen,
              currentIndex: controller.currentIndex,
              items: const [
                BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: 'Info', icon: Icon(Icons.settings)),
                BottomNavigationBarItem(
                    label: 'Upload', icon: Icon(Icons.photo)),
                BottomNavigationBarItem(
                    label: 'Profile', icon: Icon(Icons.manage_accounts)),
              ])),
    );
  }
}
