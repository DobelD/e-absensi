import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eabsenku/app/modules/absensi/views/absen_ready.dart';
import 'package:eabsenku/styles/shadows.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../styles/color.dart';
import '../../../../styles/typography.dart';
import '../controllers/absensi_controller.dart';

class AbsensiView extends GetView<AbsensiController> {
  const AbsensiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Kelas 12 B IPA',
          style: text2bold,
        ),
        elevation: 0,
        backgroundColor: colorPrimary,
        actions: [IconButton(onPressed: () {}, icon: Icon(IconlyBold.chart))],
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 42,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: dissBg, width: 1.2)),
                  child: GetBuilder<AbsensiController>(builder: (context) {
                    return DropdownButton2<Map<String, dynamic>>(
                        hint: Text('Pilih Kelas', style: text2normal),
                        isExpanded: true,
                        itemPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        buttonPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        underline: SizedBox(),
                        value: controller.selectedKelas,
                        items: controller.kelas.map((e) {
                          return DropdownMenuItem<Map<String, dynamic>>(
                              value: e,
                              child: Text(
                                "Kelas ${e['kelas']}",
                                style: text2normal,
                              ));
                        }).toList(),
                        onChanged: (value) {
                          controller.changeKelas(value!);
                        });
                  })),
              SizedBox(height: 16),
              absenRaedy(),
              SizedBox(height: 120),
            ],
          ))),
      bottomSheet: GetBuilder<AbsensiController>(builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: Get.height * 0.1,
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.white, boxShadow: [Shadows().upShadow]),
          child: SizedBox(
              height: 42,
              width: Get.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: context.formatted.compareTo(
                                  context.startjamKelas.toString()) >=
                              0 &&
                          context.formatted
                                  .compareTo(context.endjamKelas.toString()) <=
                              0
                      ? () => controller.date()
                      : null,
                  child: Text(
                    'Simpan Absen',
                    style: text2normal,
                  ))),
        );
      }),
    );
  }
}
