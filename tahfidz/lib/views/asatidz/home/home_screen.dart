import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/profile_avatar.dart';
import 'package:tahfidz/controllers/asatid_controller.dart';
import 'package:tahfidz/model/asatidz.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/aurh/login_page.dart';
import 'package:tahfidz/views/asatidz/home/components/asatidz_menu.dart';
import 'package:tahfidz/views/asatidz/profile/profile_screen.dart';
import 'package:tahfidz/views/walisantri/home/components/menu_section.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  // final Asatid asatid;

  HomeScreen();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ProfileController profileController = ProfileController();
  AsatidController asatidController = Get.put(AsatidController());

  @override
  Widget build(BuildContext context) {
    final heightBody = MediaQuery.of(context).size.height;
    final widhtBody = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackground,
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
                    children: const [
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
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: FutureBuilder(
                            future: RemoteServices.getUserInfo(
                                SpUtil.getString('token')!),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              // print(snapshot.data);

                              Asatidz? asatidz = snapshot.data;

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
                              } else if (snapshot.data == null) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        backgroundColor: Colors.yellow,
                                        strokeWidth: 10,
                                        // value: 1,
                                        color: mainColor,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text("Data Sedang Dalam Perjalanan")
                                    ],
                                  ),
                                );
                                // return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return const CircularProgressIndicator();
                              }
                              // print(asatid.avatar);

                              return Column(
                                // color: mainColor,
                                children: [
                                  ProfilePicture(
                                      sizeAvatar: 90,
                                      sizeIcon: 0,
                                      widthBtn: 0,
                                      avatar: asatidz!.gambar),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    SpUtil.getString("nama")!,
                                    // SpUtil.getString('id_role')!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    asatidz.hakAkses!,
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
              showMenu(int.parse(SpUtil.getString('id_role')!))
            ],
          ),
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Get.to(ProfileScreen(
          telepon: SpUtil.getString('no_hp'),
          token: SpUtil.getString('token'),
        ));
        break;
      case 1:
        SpUtil.clear();
        Get.off(LoginPage());
        break;
      default:
    }
  }

  Widget showMenu(int idRole) {
    var menu;
    if (idRole == 3) {
      menu = SectionMenuAsatidz();
    } else if (idRole == 4) {
      menu = SectionMenuSantri();
    }
    return menu;
  }
}
