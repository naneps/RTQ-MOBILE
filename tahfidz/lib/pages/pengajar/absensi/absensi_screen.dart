import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/profile_avatar.dart';

class Absensi_Screen extends StatefulWidget {
  const Absensi_Screen({Key? key}) : super(key: key);

  @override
  State<Absensi_Screen> createState() => _Absensi_ScreenState();
}

class _Absensi_ScreenState extends State<Absensi_Screen> {
  @override
  Widget build(BuildContext context) {
    final heightBody = MediaQuery.of(context).size.height;
    final widhtBody = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          "Absensi",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
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
                  fit: StackFit.expand,
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
                      height: 220,
                      width: widhtBody / 1.2,
                      child: Card(
                        // color: mainColor,
                        elevation: 1,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 200,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: widhtBody,
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                color: Colors.green,
                child: ListView(
                  children: [
                    ListTile(
                      leading: ProfilePicture(
                        sizeAvatar: 50,
                        sizeIcon: 0,
                        widthBtn: 0,
                      ),
                      title: Text("Ahamad Udin"),
                    )
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
