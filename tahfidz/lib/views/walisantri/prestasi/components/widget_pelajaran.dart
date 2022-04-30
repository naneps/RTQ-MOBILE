import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';

class WidgetPelajaran extends StatelessWidget {
  WidgetPelajaran(
      {Key? key, required this.width, this.pelajaran, this.nilai, this.nomor})
      : super(key: key);

  double? width;
  String? pelajaran;
  String? nilai;
  String? nomor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 60,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.2,
            blurRadius: 5,
            color: Colors.grey.withOpacity(0.8),
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/nomor.png',
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
                Text(
                  "$nomor",
                  style: GoogleFonts.poppins(fontSize: 16),
                )
              ],
            ),
          ),
          Expanded(flex: 3, child: Container()),
          Container(
            alignment: Alignment.centerLeft,
            width: 200,
            height: 60,
            // color: Colors.black,
            child: Text(
              "$pelajaran",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(flex: 5, child: Container()),
          Container(
            width: 50,
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                color: mainColor, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                "$nilai",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
