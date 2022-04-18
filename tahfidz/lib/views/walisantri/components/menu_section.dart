import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tahfidz/components/item-menu.dart';
import 'package:tahfidz/views/pengajar/absensi/absensi_screen.dart';

class SectionMenuSantri extends StatelessWidget {
  const SectionMenuSantri({Key? key}) : super(key: key);

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
              onTap: () {
                print("object");
              },
            ),
            ItemMenu(
              title: 'Iuran',
              icon: Icons.book,
              color: 0xffFED525,
              onTap: () => {
                Get.to(AbsensiScreen(), transition: Transition.circularReveal)
              },
            ),
            ItemMenu(
              title: 'Prestasi',
              icon: Icons.book_online_outlined,
              color: 0xffFD637B,
              onTap: () {},
            ),
            ItemMenu(
                onTap: () {},
                title: 'Santri',
                icon: Icons.person,
                color: 0xff21CDFF),
          ],
        ),
      ),
    );
  }
}
