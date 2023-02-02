import 'package:eabsenku/app/modules/absensi/controllers/absensi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

import '../../../../styles/color.dart';
import '../../../../styles/shadows.dart';
import '../../../../styles/typography.dart';

Widget absenRaedy() {
  final controller = Get.put(AbsensiController());
  return SizedBox(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GetBuilder<AbsensiController>(builder: (context) {
        return context.startjamKelas == null
            ? SizedBox(
                height: Get.height * 0.5,
                width: Get.width * 0.9,
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        child: Lottie.network(
                            'https://assets4.lottiefiles.com/packages/lf20_eIXuIz.json')),
                    SizedBox(height: 22),
                    Text(
                      'Pilih kelas!',
                      style: text1normal,
                    )
                  ],
                )))
            : Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: colorPrimary.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          IconlyLight.time_circle,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          context.jamKelas.toString(),
                          style: text2normal,
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          IconlyLight.document,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          context.pelajaranKelas.toString(),
                          style: text2normal,
                        )
                      ],
                    ),
                  ],
                ));
      }),
      SizedBox(height: 24),
      Divider(color: dissBg, height: 0),
      SizedBox(height: 24),
      GetBuilder<AbsensiController>(builder: (context) {
        return Column(
          children: [
            Visibility(
                visible: context.formatted
                            .compareTo(context.startjamKelas.toString()) >=
                        0 &&
                    context.formatted
                            .compareTo(context.endjamKelas.toString()) <=
                        0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Murid',
                      style: text2bold,
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [Shadows().normal]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'No',
                                    style: text2bold,
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    'Nama',
                                    style: text2bold,
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'H',
                                            style: text2bold,
                                          ),
                                          Text(
                                            'I',
                                            style: text2bold,
                                          ),
                                          Text(
                                            'A',
                                            style: text2bold,
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Divider(
                            color: dissBg,
                            height: 0,
                            thickness: 1.2,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.listMurids.length,
                              itemBuilder: (context, index) {
                                final murid = controller.listMurids[index];
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              '${index + 1}',
                                              style: text2normal,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Expanded(
                                            flex: 6,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 6),
                                              child: Text(
                                                '${murid.nama}',
                                                overflow: TextOverflow.ellipsis,
                                                style: text2normal,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      height: 12,
                                                      width: 12,
                                                      child: GetBuilder<
                                                              AbsensiController>(
                                                          builder: (context) {
                                                        return Checkbox(
                                                          checkColor:
                                                              Colors.white,
                                                          side: BorderSide(
                                                              color: dissBg,
                                                              width: 1.4),
                                                          fillColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      colorEdit),
                                                          value: murid.h_status,
                                                          onChanged: (value) {
                                                            controller.hadir(
                                                                value!, index);
                                                          },
                                                          visualDensity:
                                                              VisualDensity(
                                                                  vertical: 0,
                                                                  horizontal:
                                                                      0),
                                                        );
                                                      }),
                                                    ),
                                                    SizedBox(
                                                      height: 12,
                                                      width: 12,
                                                      child: GetBuilder<
                                                              AbsensiController>(
                                                          builder: (context) {
                                                        return Checkbox(
                                                          side: BorderSide(
                                                              color: dissBg,
                                                              width: 1.4),
                                                          checkColor:
                                                              Colors.white,
                                                          fillColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      colorWarning),
                                                          value:
                                                              murid.iz_status,
                                                          onChanged: (value) {
                                                            controller.izin(
                                                                value!, index);
                                                          },
                                                          visualDensity:
                                                              VisualDensity(
                                                                  vertical: 0,
                                                                  horizontal:
                                                                      0),
                                                        );
                                                      }),
                                                    ),
                                                    SizedBox(
                                                      height: 12,
                                                      width: 12,
                                                      child: GetBuilder<
                                                              AbsensiController>(
                                                          builder: (context) {
                                                        return Checkbox(
                                                          side: BorderSide(
                                                              color: dissBg,
                                                              width: 1.4),
                                                          checkColor:
                                                              Colors.white,
                                                          fillColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      colorDelete),
                                                          value: murid.a_status,
                                                          onChanged: (value) {
                                                            controller.absen(
                                                                value!, index);
                                                          },
                                                          visualDensity:
                                                              VisualDensity(
                                                                  vertical: 0,
                                                                  horizontal:
                                                                      0),
                                                        );
                                                      }),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    GetBuilder<AbsensiController>(
                                      builder: (context) {
                                        return murid.iz_status == true
                                            ? SizedBox(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 16),
                                                  child: SizedBox(
                                                    height: 40,
                                                    child: TextField(
                                                      cursorColor: colorPrimary,
                                                      decoration: InputDecoration(
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          contentPadding:
                                                              EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 4),
                                                          hintText:
                                                              'Izi perizinan...',
                                                          hintStyle: GoogleFonts.montserrat(
                                                              fontSize: 12,
                                                              color: dissText),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      8),
                                                              borderSide: BorderSide(
                                                                  color: dissBg,
                                                                  width: 1.2)),
                                                          disabledBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      8),
                                                              borderSide: BorderSide(
                                                                  color: dissBg,
                                                                  width: 1.2)),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(8),
                                                              borderSide: BorderSide(color: dissBg, width: 1.2))),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox();
                                      },
                                    ),
                                    Divider(
                                      color: dissBg,
                                      height: 0,
                                    )
                                  ],
                                );
                              })
                        ],
                      ),
                    ),
                  ],
                )),
            Visibility(
                visible: context.formatted
                        .compareTo(context.startjamKelas.toString()) <=
                    0,
                child: SizedBox(
                    height: Get.height * 0.5,
                    width: Get.width * 0.9,
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            child: Lottie.network(
                                'https://assets4.lottiefiles.com/packages/lf20_eIXuIz.json')),
                        SizedBox(height: 22),
                        Text(
                          'Belum waktunya Absen!',
                          style: text1normal,
                        )
                      ],
                    )))),
            Visibility(
                visible: context.formatted
                        .compareTo(context.endjamKelas.toString()) >=
                    0,
                child: SizedBox(
                    height: Get.height * 0.5,
                    width: Get.width * 0.9,
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            child: Lottie.network(
                                'https://assets4.lottiefiles.com/packages/lf20_eIXuIz.json')),
                        SizedBox(height: 22),
                        Text(
                          'Waktu absensi sudah habis!',
                          style: text1normal,
                        )
                      ],
                    )))),
          ],
        );
      }),
    ],
  ));
}
