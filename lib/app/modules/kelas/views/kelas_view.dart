import 'package:eabsenku/styles/shadows.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

import '../../../../styles/color.dart';
import '../../../../styles/typography.dart';
import '../controllers/kelas_controller.dart';

class KelasView extends GetView<KelasController> {
  const KelasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBg,
        appBar: AppBar(
          title: Text(
            'Daftar Kelas',
            style: text2bold,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: colorPrimary,
          actions: [IconButton(onPressed: () {}, icon: Icon(IconlyBold.plus))],
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
                child: Column(
              children: [
                // Filter Pencarian
                SizedBox(
                  height: 42,
                  child: TextField(
                    cursorColor: colorPrimary,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        hintText: 'Cari kelas...',
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 12, color: dissText),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daftar Kelas',
                      style: text2bold,
                    ),
                    GestureDetector(child: Icon(IconlyLight.filter, size: 22))
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12),
                            child: SwipeableTile(
                              key: UniqueKey(),
                              color: Colors.transparent,
                              swipeThreshold: 0.2,
                              direction: SwipeDirection.horizontal,
                              borderRadius: 8,
                              isElevated: false,
                              onSwiped: (direction) {
                                // Here call setState to update state
                              },
                              backgroundBuilder:
                                  (context, direction, progress) {
                                if (direction == SwipeDirection.endToStart) {
                                  // return your widget
                                } else if (direction ==
                                    SwipeDirection.startToEnd) {
                                  // return your widget
                                }
                                return SizedBox(
                                  width: Get.width,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: colorEdit,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8))),
                                          )),
                                      Expanded(
                                          flex: 5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: colorDelete,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8))),
                                          ))
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [Shadows().normal]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: colorPrimary,
                                        radius: 22,
                                        child: Text('12A', style: text1bold)),
                                    SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            child: Row(
                                          children: [
                                            Icon(
                                              IconlyBold.profile,
                                              size: 16,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Moch Ali Imron, S.Kom',
                                              style: text3normal,
                                            )
                                          ],
                                        )),
                                        SizedBox(height: 12),
                                        SizedBox(
                                            child: Row(
                                          children: [
                                            Icon(
                                              IconlyBold.graph,
                                              size: 16,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              '20 Siswa/i',
                                              style: text3normal,
                                            )
                                          ],
                                        )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                )
              ],
            ))));
  }
}
