import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class AvatarView extends GetView<HomeController> {
  const AvatarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: controller.profileImagePath.isNotEmpty
                  ? Image.file(
                      File(controller.profileImagePath.toString()),
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.photo, size: 60),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: InkWell(
            onTap: () async => await controller.getImage(),
            child: const Text(
              'UPLOAD IMAGE',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    ));
  }
}
