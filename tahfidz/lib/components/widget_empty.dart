import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';

class WidgetEmptySantri extends StatelessWidget {
  const WidgetEmptySantri({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/search.png',
          scale: 2,
        ),
        Text("Tidak Ada Santri ",
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.bold, color: kFontColor))
      ],
    );
  }
}
