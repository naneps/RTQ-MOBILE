import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';

class WidgetAttendance extends StatelessWidget {
  const WidgetAttendance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.redAccent,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            blurStyle: BlurStyle.inner,
            offset: Offset(1, 3), // changes position of shadow
          ),
        ],
      ),

      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height / 2.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/checklist.png'),
          SizedBox(
            height: 10,
          ),
          Text(
            "Anda sudah absen hari ini",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: kFontColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
