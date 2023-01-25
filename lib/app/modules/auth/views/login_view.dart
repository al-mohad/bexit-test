import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/enums/view_state.dart';
import '../../../global/constants.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('Login')),
            const SizedBox(height: 50),
            TextFormField(
              controller: controller.email,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.person),
                contentPadding: const EdgeInsets.all(16.0),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter email' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.person),
                contentPadding: const EdgeInsets.all(16.0),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter password' : null,
            ),
            const SizedBox(height: 50),
            Obx(() => controller.viewState == ViewState.busy
                ? spinkit
                : ElevatedButton(
                    onPressed: controller.login,
                    child: const Text('Login'),
                  )),
            Obx(() => controller.viewState == ViewState.busy
                ? const SizedBox.shrink()
                : TextButton(
                    onPressed: controller.toggleForm,
                    child: const Text('Dont have an account? Register'),
                  )),
          ],
        ),
      ),
    );
  }
}
