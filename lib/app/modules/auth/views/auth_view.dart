import 'package:bexit_test/app/modules/auth/views/login_view.dart';
import 'package:bexit_test/app/modules/auth/views/registion_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.showLogin
            ? const LoginView()
            : const RegistrationView()));
  }
}
