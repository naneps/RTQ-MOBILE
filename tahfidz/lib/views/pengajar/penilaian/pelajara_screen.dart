import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/model/Jenjang.dart';
import 'package:tahfidz/model/santri.dart';
import 'package:tahfidz/views/pengajar/penilaian/components/list_santri.dart';

class PelajaranScreen extends StatefulWidget {
  // String? id;
  final Jenjang? jenjang;

  PelajaranScreen({this.jenjang, Key? key}) : super(key: key);

  @override
  State<PelajaranScreen> createState() => _PelajaranScreenState();
}

class _PelajaranScreenState extends State<PelajaranScreen> {
  JenjangController jenjangController = Get.put(JenjangController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: mainColor,
        title: Text("${widget.jenjang!.namaKelas}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Container(
            width: width,
            // child:
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width,
                  height: 400,
                  padding: EdgeInsets.all(10),
                  // color: mainColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Daftar Santri ",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: greyColor),
                      ),
                      Container(
                        height: height,
                        width: width,
                        child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return ListSantri(
                                namaSantri: widget.jenjang!.namaKelas![index]);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Text(
                    "Hafalan",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
