import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/widget_number.dart';
import 'package:tahfidz/model/pelajaran.dart';

class CardPelajaran extends StatefulWidget {
  double? nilai = 0;
  int? nomor;
  Pelajaran? pelajaran;
  CardPelajaran({this.pelajaran, this.nomor, this.nilai, Key? key})
      : super(key: key);

  @override
  State<CardPelajaran> createState() => _CardPelajaranState();
}

class _CardPelajaranState extends State<CardPelajaran> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(35))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WidgetNumber(
            number: widget.nomor.toString(),
          ),
          Container(
            width: 140,
            // color: Colors.blueAccent,
            margin: EdgeInsets.only(left: 10),
            child: Text(
              widget.pelajaran!.namaPelajaran!,
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            // color: Colors.blueAccent,
            // height: 90,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.nilai!.toInt().toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                    )),
                Slider(
                    thumbColor: mainColor,
                    activeColor: mainColor,
                    inactiveColor: mainColor.withOpacity(0.2),
                    min: 0,
                    max: 100,
                    label: "${widget.nilai}",
                    value: widget.nilai!,
                    // divisions: 1,
                    onChanged: (value) {
                      setState(() {
                        widget.nilai = value;
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
