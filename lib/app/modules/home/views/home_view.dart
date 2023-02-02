import 'package:eabsenku/styles/color.dart';
import 'package:eabsenku/styles/typography.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../styles/shadows.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBg,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: Get.height * 0.15,
              width: Get.width,
              color: colorPrimary,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 38),
                    Row(
                      children: [
                        Icon(
                          Ionicons.school_outline,
                          color: Colors.white,
                        ),
                        SizedBox(width: 12),
                        Text('SMK Darul Iman',
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Ionicons.school_outline,
                          color: Colors.transparent,
                        ),
                        SizedBox(width: 12),
                        Text('Jl. Kemerdekaan 45 Gumukmas Jember',
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [Shadows().normal]),
                            child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(IconlyLight.user, size: 20),
                                        SizedBox(width: 8),
                                        Text(
                                          'Guru',
                                          style: text2normal,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text('34',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 54,
                                            fontWeight: FontWeight.w600))
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [Shadows().normal]),
                            child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(IconlyLight.profile, size: 20),
                                        SizedBox(width: 8),
                                        Text(
                                          'Murid',
                                          style: text2normal,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text('300',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 54,
                                            fontWeight: FontWeight.w600))
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [Shadows().normal]),
                            child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(IconlyLight.user, size: 20),
                                        SizedBox(width: 8),
                                        Text(
                                          'Guru',
                                          style: text2normal,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text('34',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 54,
                                            fontWeight: FontWeight.w600))
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [Shadows().normal]),
                            child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(IconlyLight.chart, size: 20),
                                        SizedBox(width: 8),
                                        Text(
                                          'Non Akademik',
                                          style: text2normal,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text('300',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 54,
                                            fontWeight: FontWeight.w600))
                                  ],
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        )));
  }
}
