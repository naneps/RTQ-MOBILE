import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/item-menu.dart';
import 'package:tahfidz/views/walisantri/iuran/iuran_screen.dart';
import 'package:tahfidz/views/walisantri/prestasi/prestasi_scres.dart';
import 'package:tahfidz/views/walisantri/profile_santri/profile_santri._screen.dart';

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
              title: Text("Dashboard"),
              icon: Icon(
                Icons.dashboard_customize,
              ),
              color: Colors.white,
              onTap: () {
                print("object");
              },
            ),
            ItemMenu(
              title: Text('Iuran'),
              icon: Icon(Icons.book),
              color: Colors.white,
              onTap: () => {
                Get.to(IuranScreen(), transition: Transition.circularReveal)
              },
            ),
            // ItemMenu(
            //   title: 'Prestasi',
            //   icon: Icons.book_online_outlined,
            //   color: 0xffFD637B,
            //   onTap: () => Get.to(PrestasiScreen()),
            // ),
            ItemMenu(
                onTap: () => Get.to(ProfileAnakScreen(),
                    transition: Transition.circularReveal),
                title: Text('Santri'),
                icon: Icon(
                  Icons.person,
                ),
                color: kMainColor),
          ],
        ),
      ),
    );
  }
}
