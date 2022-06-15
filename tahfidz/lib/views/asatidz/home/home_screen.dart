import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/profile_avatar.dart';
import 'package:tahfidz/controllers/asatid_controller.dart';
import 'package:tahfidz/controllers/auth_controllers.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/aurh/hak_akses_page.dart';
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
            margin: const EdgeInsets.only(right: 20),
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
                    children: const [
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
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      height: 150,
                      width: widhtBody,
                      child: Container(
                        // color: mainColor,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(90),
                              bottomRight: const Radius.circular(90),
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
                          padding: const EdgeInsets.all(20),
                          child: FutureBuilder(
                            future: RemoteServices.getUserInfo(
                                SpUtil.getString('token')!),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  // color: mainColor,
                                  children: [
                                    ProfilePicture(
                                        sizeAvatar: 90,
                                        sizeIcon: 0,
                                        widthBtn: 0,
                                        avatar: snapshot.data['gambar']),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      snapshot.data['nama'],
                                      // SpUtil.getString('id_role')!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      snapshot.data['hak_akses']!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              showMenu(int.parse(SpUtil.getString('id_role')!))
            ],
          ),
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) async {
    AuthController authController = AuthController();
    switch (item) {
      case 0:
        Get.to(ProfileScreen(
          telepon: SpUtil.getString('no_hp'),
          token: SpUtil.getString('token'),
        ));
        break;
      case 1:
        await authController
            .logOut(
                telepon: SpUtil.getString('no_hp'),
                token: SpUtil.getString('token'))
            .then((value) {
          if (value == true) {
            SpUtil.clear();
            Get.off(const HakAksesPage());
          }
        });
        break;
      default:
    }
  }

  Widget showMenu(int idRole) {
    var menu;
    if (idRole == 3) {
      menu = const SectionMenuAsatidz();
    } else if (idRole == 4) {
      menu = const SectionMenuSantri();
    }
    return menu;
  }
}
