import 'package:bexit_test/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<HomeController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: controller.getAccountInfo,
            icon: const Icon(Icons.person),
            label: const Text('Account Info'),
          ),
          const SizedBox(height: 50),
          ElevatedButton.icon(
            onPressed: controller.deleteAccount,
            icon: const Icon(Icons.delete_forever, color: Colors.red),
            label: const Text('Delete Account'),
          )
        ],
      ),
    );
  }
}
