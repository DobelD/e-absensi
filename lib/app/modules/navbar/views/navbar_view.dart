import 'package:eabsenku/styles/color.dart';
import 'package:eabsenku/styles/typography.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: controller.listPages,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            selectedItemColor: colorPrimary,
            unselectedItemColor: dissBg,
            selectedLabelStyle: text3normal,
            unselectedLabelStyle: text3normal,
            type: BottomNavigationBarType.fixed,
            items: [
              itemBar(IconlyBold.home, 'Home'),
              itemBar(IconlyBold.activity, 'Kelas'),
              itemBar(IconlyBold.user_2, 'Guru'),
              itemBar(IconlyBold.setting, 'Setting')
            ]),
      );
    });
  }
}

itemBar(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
