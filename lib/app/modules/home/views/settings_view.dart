import 'package:bexit_test/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/enums/view_state.dart';
import '../../../global/constants.dart';

class SettingsView extends GetView<HomeController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.changePasswordKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Change your Password',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 50),
            TextFormField(
              controller: controller.currentPassword,
              decoration: InputDecoration(
                labelText: "Current Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.person),
                contentPadding: const EdgeInsets.all(16.0),
                filled: true,
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter password' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.newPassword,
              decoration: InputDecoration(
                labelText: "New Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.person),
                contentPadding: const EdgeInsets.all(16.0),
                filled: true,
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter password' : null,
            ),
            Obx(() => controller.viewState == ViewState.busy
                ? spinkit
                : ElevatedButton(
                    onPressed: controller.changePassword,
                    child: const Text('Change Password'),
                  )),
          ],
        ),
      ),
    );
  }
}
