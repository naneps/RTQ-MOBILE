import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
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
      margin: const EdgeInsets.only(top: 50),
      width: widhtBody,
      // color: Colors.black,
      height: heightBody / 2.5,
      padding: const EdgeInsets.all(20),
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
              icon: const Icon(
                Icons.money,
                color: Colors.white,
                size: 50,
              ),
              color: kMainColor,
              onTap: () => Get.to(const IuranSantriScreen(),
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
                  LineIcons.bookOpen,
                  color: kMainColor,
                  size: 50,
                ),
                color: Colors.white,
                onTap: () => Get.to(const AbsensiScreen(),
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
                  LineIcons.alternatePencil,
                  color: kMainColor,
                  size: 50,
                ),
                color: Colors.white,
                onTap: () => Get.to(const JenjangScreen(),
                    popGesture: true, transition: Transition.fadeIn)),
            ItemMenu(
              title: Text(
                'Absensi Saya',
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              icon: const Icon(
                LineIcons.retroCamera,
                color: Colors.white,
                size: 50,
              ),
              color: kMainColor,
              onTap: () => Get.to(const MyAbsen(),
                  transition: Transition.circularReveal),
            ),
          ],
        ),
      ),
    );
  }
}
