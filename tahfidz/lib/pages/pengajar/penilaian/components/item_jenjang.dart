import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';

class CardJenjang extends StatelessWidget {
  const CardJenjang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(29))),
      child: Center(
        child: ListTile(
          title: Text(
            "Tilawah 1 ",
            style: GoogleFonts.poppins(
                color: greyColor, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            "12 Pelajaran ",
            style: GoogleFonts.poppins(
                color: greyColor, fontSize: 12, fontWeight: FontWeight.w500),
          ),
          leading: CircleAvatar(
            // radius: 50,
            child: Icon(Icons.book),
          ),
        ),
      ),

      // child: ,
    );
  }
}
