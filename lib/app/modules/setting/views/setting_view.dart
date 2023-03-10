import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../styles/color.dart';
import '../../../../styles/typography.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: AppBar(
        title: Text(
          'Setting',
          style: text2bold,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorPrimary,
      ),
      body: Center(
        child: Text(
          'SettingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
