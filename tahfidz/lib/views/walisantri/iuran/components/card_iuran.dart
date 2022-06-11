import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/data/helper.dart';
// import 'package:tahfid/model/iuran.dart';

class CardIuranSantri extends StatelessWidget {
  CardIuranSantri({
    Key? key,
    this.nominal,
    this.status,
    this.tanggal,
  }) : super(key: key);

  // final Size size;
  // final Iuran? iuran;
  String? tanggal;
  String? status;
  String? nominal;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        width: Get.width,
        // height: 80,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              color: Colors.blueAccent,
              child: LineIcon.alternateMoneyBill(
                color: Colors.white,
                size: 30,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tanggal ?? '',
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        status ?? '',
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 80,
              // margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                nominal ?? '',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              child: Icon(
                LineIcons.checkSquareAlt,
                size: 25,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
