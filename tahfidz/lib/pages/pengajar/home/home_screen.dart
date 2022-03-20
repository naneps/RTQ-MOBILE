import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:http/retry.dart';
import 'package:http/http.dart' as http;
// import 'package:progress_dialog/progress_dialog.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/item-menu.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/profile_avatar.dart';
import 'package:tahfidz/controllers/profile_controller.dart';
import 'package:tahfidz/main.dart';
import 'package:tahfidz/pages/aurh/LoginPage.dart';
import 'package:tahfidz/pages/pengajar/absen_saya/my_absensi_page.dart';
// import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/pages/pengajar/absensi/absensi_screen.dart';
import 'package:tahfidz/pages/pengajar/penilaian/penilaiann_Screen.dart';
import 'package:tahfidz/pages/pengajar/profile/profile_screen.dart';

// void main() {
//   runApp(GetMaterialApp(
//     home: HomeScreen(),
//   ));
// }

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  final String telepon;
  HomeScreen({required this.telepon});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProfileController profileController = ProfileController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    profileController.getProfil(widget.telepon);
  }

  @override
  Widget build(BuildContext context) {
    final heightBody = MediaQuery.of(context).size.height;
    final widhtBody = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: mainColor,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: PopupMenuButton(
              onSelected: (value) => onSelected(context, value as int),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        // physics: BouncingScrollPhysics(),s
        child: Container(
          height: heightBody,
          width: widhtBody,
          // padding: EdgeInsets.all(20),
          // color: Colors.black26,
          child: Column(
            children: [
              Container(
                height: heightBody / 3.5,
                width: widhtBody,
                // color: Colors.black,
                child: Stack(
                  // fit: StackFit.expand,
                  // clipBehavior: Clip.antiAliasWithSaveLayer,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      height: 150,
                      width: widhtBody,
                      child: Container(
                        // color: mainColor,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90),
                              bottomRight: Radius.circular(90),
                            ),
                            color: mainColor),
                        // width: widhtBody,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      height: 210,
                      width: widhtBody / 1.2,
                      child: Card(
                        // color: mainColor,
                        elevation: 4,
                        // shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: FutureBuilder(
                            future: profileController.getProfil(widget.telepon),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.yellow,
                                    strokeWidth: 10,
                                    // value: 1,
                                    color: mainColor,
                                  ),
                                );
                              } else if (snapshot.hasData) {
                              } else if (snapshot.hasError) {
                                return CircularProgressIndicator();
                              }
                              return Column(
                                // color: mainColor,
                                children: [
                                  ProfilePicture(
                                      sizeAvatar: 90,
                                      sizeIcon: 0,
                                      widthBtn: 0,
                                      avatar: snapshot.data['data']['gambar']!),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data['data']['nama']!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    SpUtil.getString('keterangan')!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
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
                      GestureDetector(
                          onTap: () => {print('ok')},
                          child: ItemMenu(
                              title: 'Dashboard',
                              icon: Icons.dashboard_customize,
                              color: 0xff7585F6)),
                      GestureDetector(
                        onTap: () => {
                          Get.to(AbsensiScreen(),
                              transition: Transition.circularReveal)
                        },
                        child: ItemMenu(
                            title: 'Absensi',
                            icon: Icons.book,
                            color: 0xffFED525),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(PenilaiainScreen(),
                            popGesture: true, transition: Transition.fadeIn),
                        child: ItemMenu(
                            title: 'Penilaian',
                            icon: Icons.book_online_outlined,
                            color: 0xffFD637B),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(MyAbsen(),
                            transition: Transition.circularReveal),
                        child: ItemMenu(
                            title: 'Absensi Saya',
                            icon: Icons.report_off_rounded,
                            color: 0xff21CDFF),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Get.to(ProfileScreen(telepon: SpUtil.getString('no_hp')));
        break;
      case 1:
        SpUtil.clear();
        Get.off(LoginPage());
        break;
      default:
    }
  }

  void goToProfileScreen() {
    Get.to(ProfileScreen(
      telepon: SpUtil.getString('no_hp'),
    ));
  }
}
