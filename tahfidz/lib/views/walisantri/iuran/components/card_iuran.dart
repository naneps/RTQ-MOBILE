import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/model/iuran.dart';

class CardIuran extends StatelessWidget {
  const CardIuran({
    Key? key,
    this.iuran,
    required this.size,
  }) : super(key: key);

  final Size size;
  final Iuran? iuran;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      width: size.width,
      height: 80,
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
                    iuran!.tglIuran.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    iuran!.status.toString(),
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
              iuran!.uang.toString(),
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
