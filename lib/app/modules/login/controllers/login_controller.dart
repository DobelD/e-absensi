import 'package:eabsenku/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController userC = TextEditingController();
  TextEditingController passC = TextEditingController();

  void login() {
    if (userC.text == "guru" || passC.text == "123") {
      Get.toNamed(Routes.ABSENSI);
    } else {
      Get.toNamed(Routes.NAVBAR);
    }
  }
}
