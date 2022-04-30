import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';

class ProfileAnakScreen extends StatelessWidget {
  const ProfileAnakScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Anak"),
        backgroundColor: mainColor,
        centerTitle: true,
        // excludeHeaderSemantics: true,
        elevation: 0,
      ),
      backgroundColor: mainColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15, right: 15, left: 15),
          child: Container(
            padding: EdgeInsets.all(10),
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
                  width: size.width,
                  height: size.width - 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 3),
                          blurRadius: 5,
                          color: Color.fromRGBO(0, 0, 0, 0.25))
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: mainColor,
                        child: CircleAvatar(
                          foregroundColor: Color.fromRGBO(200, 22, 23, 1),
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                          radius: 50,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Zin Ban",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: greyColor),
                      ),
                      Text(
                        "Qirupah 1",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: greyColor),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(1, 3),
                                      blurRadius: 5,
                                      color: Color.fromRGBO(0, 0, 0, 0.25))
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Rekap Nilai",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
