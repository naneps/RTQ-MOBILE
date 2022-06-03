import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';

class CardAttendance extends StatelessWidget {
  CardAttendance({
    this.alamat,
    this.tanggal,
    Key? key,
  }) : super(key: key);

  String? nama;
  String? tanggal;
  String? alamat;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            blurStyle: BlurStyle.inner,
            offset: const Offset(1, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tanggal!,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kFontColor,
                  ),
                ),
                Text(
                  alamat!,
                  maxLines: 3,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: kFontColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
