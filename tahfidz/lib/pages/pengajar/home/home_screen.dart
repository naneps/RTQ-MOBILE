import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
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
                // ProgressDialog? progress = new ProgressDialog(context);
                // progress.style(message: "Harap Tunggu...");
                // progress.show();

                SpUtil.clear();
                Get.off(MyAppPage());

                // progress.hide();
              },
              child: Icon(
                Icons.settings,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: true,
        child: Container(
          height: heightBody,
          width: widhtBody,
          // color: Colors.black26,
          child: Column(
            children: [
              Container(
                height: 350,
                width: widhtBody,
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
                      height: 252,
                      width: widhtBody,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 45, 245, 100),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      width: widhtBody / 1.25,
                      height: heightBody / 2.7,
                      child: Card(
                        color: Colors.white,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              ProfilePicture(
                                  sizeAvatar: 100, sizeBtn: 30, sizeIcon: 18),
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
              Container(
                color: Colors.white,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    ItemMenu(
                        title: 'Expend', icon: Icons.home, color: 0xffFED525),
                    ItemMenu(
                        title: 'Collection',
                        icon: Icons.star,
                        color: 0xffFD637B),
                    ItemMenu(
                        title: 'Incomes',
                        icon: Icons.monetization_on,
                        color: 0xff21CDFF),
                    ItemMenu(
                        title: 'Sales',
                        icon: Icons.show_chart,
                        color: 0xff7585F6)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
