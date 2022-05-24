import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/widget_number.dart';
import 'package:tahfidz/model/nilai.dart';
import 'package:tahfidz/model/pelajaran.dart';
import 'package:tahfidz/services/remote_services.dart';

class CardPelajaran extends StatefulWidget {
  // double? nilai = 0;
  int? nomor;
  Pelajaran? pelajaran;
  CardPelajaran({this.pelajaran, this.nomor, Key? key}) : super(key: key);

  @override
  State<CardPelajaran> createState() => _CardPelajaranState();
}

class _CardPelajaranState extends State<CardPelajaran> {
  final args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print("args card pe;ajaran  $args");
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
              width: 120,
              child: FutureBuilder<Nilai>(
                future: RemoteServices.filterNilai(
                    idPelajaran: widget.pelajaran!.id.toString(),
                    nis: args[2].nis),
                builder: (context, AsyncSnapshot snapshot) {
                  print(snapshot.data.nilai);
                  if (snapshot.hasData) {
                    Nilai nilai = snapshot.data;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(nilai.nilai!.toInt().toString(),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                            )),
                        Slider(
                            thumbColor: mainColor,
                            activeColor: mainColor,
                            inactiveColor: mainColor.withOpacity(0.2),
                            min: 0,
                            max: 100,
                            label: "${nilai.nilai}",
                            value: nilai.nilai!,
                            divisions: 10,
                            onChanged: (value) {
                              setState(() {
                                RemoteServices.setNilai(nilai.id!, value);
                              });
                            })
                      ],
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (!snapshot.hasData) {
                    return Center(
                      child: Text("Belum ada penilaian"),
                    );
                  } else {
                    return Center(
                      child: Text("Error"),
                    );
                  }
                },
              ))
        ],
      ),
    );
  }
}
