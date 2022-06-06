import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/model/absen.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/asatidz/absen_mandiri/components/card_attendance.dart';
import 'package:tahfidz/views/asatidz/absen_mandiri/components/widget_succes_attendance.dart';
import 'package:tahfidz/views/asatidz/absen_mandiri/components/widget_foto.dart';
import 'package:tahfidz/views/asatidz/absen_mandiri/rekap_absensi_page.dart';

class MyAbsen extends StatefulWidget {
  const MyAbsen({Key? key}) : super(key: key);

  @override
  State<MyAbsen> createState() => _MyAbsenState();
}

class _MyAbsenState extends State<MyAbsen> {
  File? imageFile;
  @override
  void initState() {
    super.initState();
    RemoteServices.getAbesnToday();
    RemoteServices.fetchRekapAbsen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        // shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          "Absen Mandiri",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height / 1.9,
                width: Get.width,
                // color: Colors.amber,
                margin: const EdgeInsets.only(bottom: 10),
                child: FutureBuilder(
                  future: RemoteServices.getAbesnToday(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // r eturn Center(child:,)
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      return const WidgetAttendance();
                    } else {
                      return WidgetFoto(fileImage: imageFile);
                    }
                  },
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Absensi hari Ini ",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: kFontColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.to(const RekapAbsensiPage(),
                                transition: Transition.leftToRight),
                            child: Text(
                              "Lihat Rekap ",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: kFontColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FutureBuilder<Abesn?>(
                        future: RemoteServices.getAbesnToday(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );

                            // return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasData) {
                            return CardAttendance(
                              abesn: snapshot.data,
                            );
                          } else {
                            return Center(
                              child: Text(
                                "Mari Absen Mandiri(Mandi Sendiri)",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
