import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/item-menu.dart';
import 'package:tahfidz/views/asatidz/absen_mandiri/my_absensi_page.dart';
import 'package:tahfidz/views/asatidz/absensi/absensi_screen.dart';
import 'package:tahfidz/views/asatidz/iuran_santri/iuran_santri._screen.dart';
import 'package:tahfidz/views/asatidz/penilaian/list_jenjang_screen.dart';

class SectionMenuAsatidz extends StatelessWidget {
  const SectionMenuAsatidz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widhtBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: widhtBody,
      // color: Colors.black,
      height: heightBody / 2.5,
      padding: EdgeInsets.all(20),
      child: Container(
        // color: Colors.white,
        height: heightBody,
        width: widhtBody,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 6,
          runSpacing: 6,
          children: [
            ItemMenu(
              title: Text(
                'Iuran Santri',
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              icon: Icon(
                Icons.dashboard_customize,
                color: Colors.white,
              ),
              color: kMainColor,
              onTap: () => Get.to(IuranSantriScreen(),
                  transition: Transition.circularReveal),
            ),
            ItemMenu(
                title: Text(
                  'Absensi',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kMainColor),
                ),
                icon: Icon(
                  Icons.book,
                  color: kMainColor,
                ),
                color: Colors.white,
                onTap: () => Get.to(AbsensiScreen(),
                    transition: Transition.circularReveal)),
            ItemMenu(
                title: Text(
                  'Penilaian',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kMainColor),
                ),
                icon: Icon(
                  Icons.book_online_outlined,
                  color: kMainColor,
                ),
                color: Colors.white,
                onTap: () => Get.to(JenjangScreen(),
                    popGesture: true, transition: Transition.fadeIn)),
            ItemMenu(
              title: Text(
                'Absensi Saya',
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              icon: Icon(
                Icons.report_off_rounded,
                color: Colors.white,
              ),
              color: kMainColor,
              onTap: () =>
                  Get.to(MyAbsen(), transition: Transition.circularReveal),
            ),
          ],
        ),
      ),
    );
  }
}
