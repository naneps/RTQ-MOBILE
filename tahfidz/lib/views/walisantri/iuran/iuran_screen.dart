import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/components/constants.dart';

class IuranScreen extends StatelessWidget {
  const IuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(228, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Rekap Iuran"),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
        // bottom: Preff ,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            width: size.width,
            height: size.height,
            // color: mainColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Rekap iuran ",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                CardIuran(size: size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardIuran extends StatelessWidget {
  const CardIuran({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      width: size.width,
      height: 60,
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "10 Oktober 2002 ",
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Sudah di terima",
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Rp.50000 ",
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
    );
  }
}
