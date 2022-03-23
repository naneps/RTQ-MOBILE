import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/components/constants.dart';

class PelajaranScreen extends StatelessWidget {
  String? id;
  PelajaranScreen({this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: mainColor,
        title: Text("$id"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: width,
        // child:
        child: Column(
          children: [
            Container(
              width: width,
              // height: 60,
              // color: mainColor,
              child: Text("Daftar Pelajaran",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: greyColor,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width,
              height: 500,
              color: mainColor,
            )
          ],
        ),
      ),
    );
  }
}
