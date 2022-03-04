import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
// import 'package:progress_dialog/progress_dialog.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/item-menu.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/profile_avatar.dart';
import 'package:tahfidz/main.dart';
// ignore: duplicate_import
import 'package:tahfidz/components/constants.dart';

void main() {
  runApp(GetMaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String? nama = SpUtil.getString("nama", defValue: "");
  final String? keterangan = SpUtil.getString("keterangan", defValue: "");

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
          // PopupMenuButton(itemBuilder: itemBuilder),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                SpUtil.clear();
                Get.off(MyAppPage());
              },
              child: Icon(
                Icons.logout_rounded,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          height: heightBody,
          width: widhtBody,
          // padding: EdgeInsets.all(20),
          // color: Colors.black26,
          child: Column(
            children: [
              Container(
                height: 250,
                width: widhtBody,
                // color: Colors.black,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        width: widhtBody,
                        height: 200,
                        // color: Colors.black,
                        child: Row(
                          children: [],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      height: 145,
                      width: widhtBody,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 45, 245, 100),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(90),
                            bottomRight: Radius.circular(90),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      width: widhtBody / 1.25,
                      height: heightBody / 3.5,
                      child: Card(
                        color: Colors.white,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              ProfilePicture(
                                  sizeAvatar: 100,
                                  heightBtn: 20,
                                  widthBtn: 40,
                                  sizeIcon: 18),
                              SizedBox(height: 15),
                              Text(
                                nama!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                keterangan!,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), //Hero Section
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: widhtBody,
                // color: Colors.black,
                height: heightBody / 2,
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
                        onTap: () => {print('ok')},
                        child: ItemMenu(
                            title: 'Absensi',
                            icon: Icons.book,
                            color: 0xffFED525),
                      ),
                      GestureDetector(
                        onTap: () => {print('ok')},
                        child: ItemMenu(
                            title: 'Penilaian',
                            icon: Icons.book_online_outlined,
                            color: 0xffFD637B),
                      ),
                      GestureDetector(
                        onTap: () => {print('ok')},
                        child: ItemMenu(
                            title: 'Rekap',
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
}
