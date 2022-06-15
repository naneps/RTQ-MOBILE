import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/data/helper.dart';
import 'package:tahfidz/model/santri_by.dart';
import 'package:tahfidz/views/asatidz/penilaian/pelajaran_screen.dart';

class CardAbsensiSantri extends StatelessWidget {
  SantriBy santri;
  String? idJenjang;
  CardAbsensiSantri({required this.santri, this.idJenjang, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 2),
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 1)
          ]),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Container(
              height: size.height,
              // color: mainColor,
              width: size.width,
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${santri.namaLengkap}",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: greyColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: -1,
            child: Container(
              // height: 50,
              // width: 30,
              // color: Colors.black,
              child: Container(
                  height: 50,
                  width: 100,
                  child: FutureBuilder(
                    future: getAbsenTodaySantri(santri.id.toString()),
                    builder: (context, AsyncSnapshot snapshot) {
                      print(snapshot.data);

                      return Text(
                          snapshot.data['keterangan']?.toString() ?? "0");
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
