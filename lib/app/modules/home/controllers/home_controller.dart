import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bexit_test/app/data/repositories/user_repository.dart';
import 'package:bexit_test/app/modules/home/views/account_view.dart';
import 'package:bexit_test/app/modules/home/views/avatar_view.dart';
import 'package:bexit_test/app/modules/home/views/profile_view.dart';
import 'package:bexit_test/app/modules/home/views/settings_view.dart';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/enums/view_state.dart';
import '../../../data/network/api_error.dart';

class HomeController extends GetxController {
  late UserRepository _userRepository;
  final changePasswordKey =
      GlobalKey<FormState>(debugLabel: 'changePasswordKey');
  final _currentIndex = 0.obs;
  late TextEditingController currentPassword, newPassword;
  final _viewState = ViewState.idle.obs;
  final profileImagePath = ''.obs;

  ViewState get viewState => _viewState.value;

  List<Widget> screens = [
    const AccountView(),
    const SettingsView(),
    const AvatarView(),
    const ProfileView(),
  ];

  int get currentIndex => _currentIndex.value;
  @override
  void onInit() {
    currentPassword = TextEditingController();
    newPassword = TextEditingController();
    _userRepository = UserRepository();
    super.onInit();
  }

  changeScreen(int value) {
    _currentIndex.value = value;
    update();
  }

  verifyUser() {
    const data = 'any';
    _viewState.value = ViewState.busy;
    update();

    _userRepository.verifyAccount(code: data).then((value) {
      _viewState.value = ViewState.idle;
      update();
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: value.message,
      ).show();
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

  changePassword() {
    if (!changePasswordKey.currentState!.validate()) return;
    final data = {
      "userId": 'any',
      "currentPassword": currentPassword.text.trim(),
      "newPassword": newPassword.text.trim(),
    };
    _viewState.value = ViewState.busy;
    update();

    _userRepository.changePassword(data: data).then((value) {
      _viewState.value = ViewState.idle;
      update();
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: value.message,
      ).show();
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

  getAccountInfo() {
    final id = {
      "userId": 'any',
    };
    _viewState.value = ViewState.busy;
    update();

    _userRepository.accountInfo(data: id).then((value) {
      _viewState.value = ViewState.idle;
      update();
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: value.message,
      ).show();
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

  deleteAccount() {
    final id = {
      "userId": 'any',
    };
    _viewState.value = ViewState.busy;
    update();

    _userRepository.accountInfo(data: id).then((value) {
      _viewState.value = ViewState.idle;
      update();
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: value.message,
      ).show();
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

  Future<String?> getImage() async {
    File file;
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        file = File(result.files.single.path!);
        // File? croppedFile = await ImageCropper().cropImage(
        //   sourcePath: file.path,
        //   aspectRatioPresets: [
        //     CropAspectRatioPreset.square,
        //     CropAspectRatioPreset.ratio3x2,
        //     CropAspectRatioPreset.original,
        //     CropAspectRatioPreset.ratio4x3,
        //     CropAspectRatioPreset.ratio16x9
        //   ],
        // ) as File;
        // // file = croppedFile!;
        profileImagePath.value = file.path;
        _viewState.value = ViewState.busy;
        update();
        await updateAvatar();
        return file.path;
        // return file.path;
      } else {
        // User canceled the picker
        return null;
      }
    } on Exception catch (e) {
      print(e);
    }

    return null;
  }

  updateAvatar() async {
    try {
      dio.FormData avatarData = dio.FormData.fromMap({
        'userId': await dio.MultipartFile.fromFile(
          profileImagePath.value,
          filename: profileImagePath.value.split(Platform.pathSeparator).last,
        ),
      });

      await _userRepository.uploadPhoto(data: avatarData).then((value) {
        update();
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: value.message,
        ).show();
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
      _viewState.value = ViewState.idle;
      update();
      // homeController.getProfile();
    } catch (e) {
      print(e);
    }
    update();
  }
}
