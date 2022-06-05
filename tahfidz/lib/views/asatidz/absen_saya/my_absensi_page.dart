import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/views/asatidz/absen_saya/components/card_attendance.dart';
import 'package:tahfidz/views/asatidz/absen_saya/components/widget_succes_attendance.dart';
import 'package:tahfidz/views/asatidz/absen_saya/components/widget_foto.dart';

import '../../../data/dumy+data.dart';

class MyAbsen extends StatefulWidget {
  const MyAbsen({Key? key}) : super(key: key);

  @override
  State<MyAbsen> createState() => _MyAbsenState();
}

class _MyAbsenState extends State<MyAbsen> {
  File? imageFile;

  // static String get s => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        // shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          "Absen Mandiri",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<bool?>(
              future: checkAbsenToday(),
              builder: (context, snapshot) {
                // print(dataAbensi);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  print('data cek absensi ${snapshot.data}');

                  if (snapshot.data == true) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.8,
                      // he
                      // height: 650,
                      // color: kMainColor,
                      child: Column(
                        children: [
                          const WidgetAttendance(),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            // color: Colors.blueAccent,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 3,
                            child: ListView.builder(
                                itemCount: dataAbensi.length,
                                itemBuilder: (context, index) {
                                  return CardAttendance(
                                    alamat: dataAbensi[index]['alamat'],
                                    tanggal: dataAbensi[index]['tanggal'],
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  }
                } else if (!snapshot.hasData) {
                  return WidgetFoto(
                    fileImage: imageFile,
                  );
                } else {}
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> checkAbsenToday() async {
    var date = DateTime.now().day.toString() +
        '-' +
        DateTime.now().month.toString() +
        '-' +
        DateTime.now().year.toString();
    print(date);
    for (var i = 0; i < dataAbensi.length; i++) {
      if (dataAbensi[i]['tanggal'] == date) {
        print('hari ini sudah absen');
        return await isAbsen();
      } else {
        print(dataAbensi[i]['tanggal']);
        print("hari Ini Belum Absen");
        return await isNotAbsen();
      }
    }
  }
}
