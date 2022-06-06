import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/model/absen.dart';

class CardAttendance extends StatelessWidget {
  CardAttendance({
    this.abesn,
    Key? key,
  }) : super(key: key);

  Abesn? abesn;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 50,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 175, 255, 161),
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
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(abesn!.gambar!),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  abesn!.tanggalAbsen.toString(),
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kFontColor,
                  ),
                ),
                Text(
                  abesn!.alamat!,
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
