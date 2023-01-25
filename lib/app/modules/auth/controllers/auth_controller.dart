import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bexit_test/app/data/network/api_error.dart';
import 'package:bexit_test/app/data/repositories/user_repository.dart';
import 'package:bexit_test/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/enums/view_state.dart';

class AuthController extends GetxController {
  late UserRepository _userRepository;
  late TextEditingController firstName, lastName, phone, email, password;
  final registrationFormKey =
      GlobalKey<FormState>(debugLabel: '_registrationFormKey');
  final loginFormKey = GlobalKey<FormState>(debugLabel: '_loginFormKey');
  final _viewState = ViewState.idle.obs;
  ViewState get viewState => _viewState.value;

  final _showLogin = true.obs;
  bool get showLogin => _showLogin.value;
  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    _userRepository = UserRepository();
    super.onInit();
  }

  register() async {
    if (!registrationFormKey.currentState!.validate()) return;

    _viewState.value = ViewState.busy;
    update();
    final data = {
      "firstname": firstName.text.trim(),
      "lastname": lastName.text.trim(),
      "phone": phone.text.trim(),
      "email": email.text.trim(),
      "password": password.text.trim(),
    };

    _userRepository.register(data: data).then((value) {
      _viewState.value = ViewState.idle;
      update();
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: value.message,
      ).show();
      Get.toNamed(Routes.HOME);
    }).catchError((dioError) {
      _viewState.value = ViewState.idle;
      update();
      final e = DioExceptions.fromDioError(dioError);
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: e.message,
      ).show();
    });
  }

  toggleForm() {
    _showLogin.value = !_showLogin.value;
    update();
  }

  login() {
    if (!loginFormKey.currentState!.validate()) return;
    final data = {
      "email": email.text.trim(),
      "password": password.text.trim(),
    };
    _viewState.value = ViewState.busy;
    update();

    _userRepository.register(data: data).then((value) {
      _viewState.value = ViewState.idle;
      update();
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: value.message,
      ).show();
      Get.toNamed(Routes.HOME);
    }).catchError((dioError) {
      _viewState.value = ViewState.idle;
      update();
      final e = DioExceptions.fromDioError(dioError);
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: e.message,
      ).show();
    });
  }
}
