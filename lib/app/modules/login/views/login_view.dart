import 'package:eabsenku/styles/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../../../styles/typography.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBg,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 250),
              SizedBox(
                height: 42,
                child: TextField(
                  cursorColor: colorPrimary,
                  controller: controller.userC,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(IconlyBold.profile, color: dissBg),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      hintText: 'Username',
                      hintStyle:
                          GoogleFonts.montserrat(fontSize: 12, color: dissText),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: colorPrimary, width: 1.2)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: dissBg, width: 1.2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: dissBg, width: 1.2))),
                ),
              ),
              SizedBox(height: 12),
              SizedBox(
                height: 42,
                child: TextField(
                  cursorColor: colorPrimary,
                  controller: controller.passC,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(IconlyBold.lock, color: dissBg),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      hintText: 'Password',
                      hintStyle:
                          GoogleFonts.montserrat(fontSize: 12, color: dissText),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: colorPrimary, width: 1.2)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: dissBg, width: 1.2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: dissBg, width: 1.2))),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                  height: 42,
                  width: Get.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () => controller.login(),
                      child: Text(
                        'Login',
                        style: text2normal,
                      )))
            ],
          )),
        ));
  }
}
