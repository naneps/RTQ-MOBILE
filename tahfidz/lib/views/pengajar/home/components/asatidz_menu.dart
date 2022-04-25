import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tahfidz/components/item-menu.dart';
import 'package:tahfidz/views/pengajar/absen_saya/my_absensi_page.dart';
import 'package:tahfidz/views/pengajar/absensi/absensi_screen.dart';
import 'package:tahfidz/views/pengajar/penilaian/penilaian_screen.dart';

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
              title: 'Dashboard',
              icon: Icons.dashboard_customize,
              color: 0xff7585F6,
              onTap: () {},
            ),
            ItemMenu(
                title: 'Absensi',
                icon: Icons.book,
                color: 0xffFED525,
                onTap: () => Get.to(AbsensiScreen(),
                    transition: Transition.circularReveal)),
            ItemMenu(
                title: 'Penilaian',
                icon: Icons.book_online_outlined,
                color: 0xffFD637B,
                onTap: () => Get.to(PenilaianScreen(),
                    popGesture: true, transition: Transition.fadeIn)),
            ItemMenu(
              title: 'Absensi Saya',
              icon: Icons.report_off_rounded,
              color: 0xff21CDFF,
              onTap: () =>
                  Get.to(MyAbsen(), transition: Transition.circularReveal),
            ),
          ],
        ),
      ),
    );
  }
}
