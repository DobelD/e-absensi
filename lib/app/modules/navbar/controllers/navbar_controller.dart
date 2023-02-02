import 'package:eabsenku/app/modules/guru/views/guru_view.dart';
import 'package:eabsenku/app/modules/home/views/home_view.dart';
import 'package:eabsenku/app/modules/kelas/views/kelas_view.dart';
import 'package:eabsenku/app/modules/setting/views/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  List<Widget> listPages = [HomeView(), KelasView(), GuruView(), SettingView()];
}
