import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/model/Jenjang.dart';
import 'package:tahfidz/views/pengajar/penilaian/components/drop_down_cabang.dart';
import 'package:tahfidz/views/pengajar/penilaian/components/list_santri.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: mainColor,
        title: Text("${widget.jenjang!.namaKelas}"),
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
              Container(
                width: width,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: DropwDownCabang(),
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
              Container(
                height: height / 2,
                width: width,
                // color: Colors.white,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: widget.jenjang!.countSantri!.length,
                  itemBuilder: (context, index) {
                    return CardPenilaianSantri(
                        id: widget.jenjang!.countSantri![index].toString(),
                        namaSantri:
                            widget.jenjang!.countSantri![index].toString());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
