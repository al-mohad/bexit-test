import 'package:bexit_test/app/data/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/constants.dart';
import '../controllers/auth_controller.dart';

class RegistrationView extends GetView<AuthController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.registrationFormKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('Registration Form')),
            const SizedBox(height: 50),
            TextFormField(
              controller: controller.firstName,
              decoration: InputDecoration(
                labelText: "First Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.person),
                contentPadding: const EdgeInsets.all(16.0),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter first name' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.lastName,
              decoration: InputDecoration(
                labelText: "Last Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.person),
                contentPadding: const EdgeInsets.all(16.0),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter last name' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.person),
                contentPadding: const EdgeInsets.all(16.0),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter phone number' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
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
              controller: controller.password,
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
                    onPressed: controller.register,
                    child: const Text('Register'),
                  )),
            Obx(() => controller.viewState == ViewState.busy
                ? const SizedBox.shrink()
                : TextButton(
                    onPressed: controller.toggleForm,
                    child: const Text('Already have an account? Login'),
                  ))
          ],
        ),
      ),
    );
  }
}
