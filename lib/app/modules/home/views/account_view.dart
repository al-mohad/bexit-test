import 'package:bexit_test/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends GetView<HomeController> {
  const AccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            'Welcome',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ElevatedButton(
            onPressed: controller.verifyUser,
            child: const Text('Verify Account Info'))
      ],
    );
  }
}
