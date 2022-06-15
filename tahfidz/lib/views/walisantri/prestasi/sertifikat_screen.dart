import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/widget_empty.dart';

class SertifikatScreen extends StatelessWidget {
  const SertifikatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sertifikat",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kFontColor,
          ),
        ),
        backgroundColor: kBackground,
        centerTitle: true,
        // excludeHeaderSemantics: true,
        elevation: 0,
      ),
      backgroundColor: kBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                WidgetEmpty(
                  label: "Belum ada sertifikat",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WidgetEmpty extends StatelessWidget {
  WidgetEmpty({Key? key, this.label}) : super(key: key);
  String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/search.png",
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        Text(
          label!,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kFontColor,
          ),
        ),
      ],
    );
  }
}
