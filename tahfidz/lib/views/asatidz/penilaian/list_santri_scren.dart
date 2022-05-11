import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/search_box.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/model/Jenjang.dart';
import 'package:tahfidz/views/asatidz/penilaian/components/list_santri.dart';

class ListSantriScreen extends StatefulWidget {
  // String? id;
  final Jenjang? jenjang;

  ListSantriScreen({this.jenjang, Key? key}) : super(key: key);

  @override
  State<ListSantriScreen> createState() => _ListSantriScreenState();
}

class _ListSantriScreenState extends State<ListSantriScreen> {
  JenjangController jenjangController = Get.put(JenjangController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: mainColor,
        title: Text(''),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: width,
          height: height,
          // padding: EdgeInsets.all(10),
          // color: Colors.black,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBox(
                labelText: "Cari Santri",
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Daftar Santri ",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Flexible(
                child: Container(
                  height: height,
                  width: width,
                  // color: Colors.white,
                  // child: ListView.builder(
                  //   physics: BouncingScrollPhysics(),
                  //   itemCount: widget.jenjang!.countSantri!.length,
                  //   itemBuilder: (context, index) {
                  //     return CardPenilaianSantri(
                  //         // id: widget.jenjang!.countSantri![index].toString(),
                  //         namaSantri:
                  //             widget.jenjang!.countSantri![index].toString());
                  //   },
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
