import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';

import 'package:tahfidz/components/search_box.dart';
import 'package:tahfidz/controllers/santri_controller.dart';
import 'package:tahfidz/model/santri.dart';
import 'package:tahfidz/views/asatidz/absensi/components/indicator_absensi.dart';
import 'package:tahfidz/views/asatidz/absensi/components/card_santri.dart';
import 'package:tahfidz/views/asatidz/absensi/components/widget_indicator.dart';

class AbsensiScreen extends StatefulWidget {
  const AbsensiScreen({Key? key}) : super(key: key);

  @override
  State<AbsensiScreen> createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  bool _isAccepted = false;
  Color hadir = Colors.green;
  Color izin = Colors.blue;
  Color sakit = Colors.yellow;
  Color alpa = Colors.red;

  Color? absenColor;
  String selectAbsen = 'hadir';
  final SantriController santriController = Get.put(SantriController());
  final _formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final heightBody = MediaQuery.of(context).size.height;
    final widhtBody = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        // shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          "Absensi",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      // ),
      body: Column(
        children: [
          SizedBox(height: 150, child: IndicatorAbsen(widhtBody: widhtBody)),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SearchBox(
              labelText: "Cari Santri",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void _onButtonPressed(Santri santri) {
    showModalBottomSheet(
      // shape: RoundedRectangleBorder(),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => selectedItem(hadir, santri),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Material(
                    color: hadir,
                    shape: StadiumBorder(),
                    elevation: 4,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Material(
                  color: izin,
                  shape: StadiumBorder(),
                  elevation: 4,
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Material(
                  color: sakit,
                  shape: StadiumBorder(),
                  elevation: 4,
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Material(
                  color: alpa,
                  shape: StadiumBorder(),
                  elevation: 4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void selectedItem(Color color, Santri santri) {
    setState(() {
      absenColor = color;
    });
    // dispose();
  }
}
