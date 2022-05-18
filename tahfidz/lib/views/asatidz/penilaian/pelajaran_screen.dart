import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:get/get.dart';
import 'package:tahfidz/components/widget_number.dart';

class PelajaranScreen extends StatefulWidget {
  const PelajaranScreen({Key? key}) : super(key: key);

  @override
  State<PelajaranScreen> createState() => _PelajaranScreenState();
}

class _PelajaranScreenState extends State<PelajaranScreen> {
  // var get = Get
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Penilaian......",
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CardPelajaran();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardPelajaran extends StatefulWidget {
  const CardPelajaran({Key? key}) : super(key: key);

  @override
  State<CardPelajaran> createState() => _CardPelajaranState();
}

class _CardPelajaranState extends State<CardPelajaran> {
  double nilai = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(35))),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WidgetNumber(
            number: '1',
          ),
          Container(
            width: 200,
            // color: Colors.blueAccent,
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "Bahasa Indonesia dan Sejarahnya",
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            // color: Colors.blueAccent,
            // height: 90,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                    )),
                Slider(
                    thumbColor: mainColor,
                    activeColor: mainColor,
                    inactiveColor: mainColor.withOpacity(0.2),
                    min: 0,
                    max: 100,
                    label: "$nilai",
                    value: 0,
                    // divisions: 1,
                    onChanged: (value) {
                      setState(() {
                        // nilai = value;
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
