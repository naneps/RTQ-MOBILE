import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetNumber extends StatelessWidget {
  String? number;
  WidgetNumber({
    this.number,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
      ),
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
            number ?? "",
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
