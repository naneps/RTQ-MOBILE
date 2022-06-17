import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/item-menu.dart';
import 'package:tahfidz/views/walisantri/iuran/iuran_screen.dart';
import 'package:tahfidz/views/walisantri/profile_santri/profile_santri._screen.dart';

class SectionMenuSantri extends StatelessWidget {
  const SectionMenuSantri({Key? key}) : super(key: key);

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
            // ItemMenu(
            //   title: const Text("Dashboard"),
            //   icon: const Icon(
            //     Icons.dashboard_customize,
            //   ),
            //   color: Colors.white,
            //   onTap: () {
            //     print("object");
            //   },
            // ),
            // ItemMenu(
            //   title: Text('Iuran'),
            //   icon: Icon(Icons.book),
            //   color: Colors.white,
            //   onTap: () => {
            //     Get.to(IuranScreen(), transition: Transition.circularReveal)
            //   },
            // ),
            // ItemMenu(
            //   title: 'Prestasi',
            //   icon: Icons.book_online_outlined,
            //   color: 0xffFD637B,
            //   onTap: () => Get.to(RekapNilaiScreen()),
            // ),
            ItemMenu(
                onTap: () => Get.to(const ProfileAnakScreen(),
                    transition: Transition.circularReveal),
                title: Text('Santri',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    )),
                icon: const Icon(
                  LineIcons.child,
                  color: Colors.white,
                  size: 50,
                ),
                color: kMainColor),
          ],
        ),
      ),
    );
  }
}
