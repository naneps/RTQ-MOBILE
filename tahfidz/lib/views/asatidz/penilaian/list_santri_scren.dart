import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/search_box.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/asatidz/penilaian/components/card_santri.dart';

class ListSantriScreen extends StatefulWidget {
  // String? id;
  final String? idJenjang;
  final String? kodeHalaqoh;
  ListSantriScreen({this.idJenjang, this.kodeHalaqoh, Key? key})
      : super(key: key);

  @override
  State<ListSantriScreen> createState() => _ListSantriScreenState();
}

class _ListSantriScreenState extends State<ListSantriScreen> {
  JenjangController jenjangController = Get.put(JenjangController());

  @override
  void initState() {
    // TODO: implement initState
    RemoteServices.filterhSantri(
        SpUtil.getString('token')!, widget.kodeHalaqoh, widget.idJenjang);
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
              // Text("${widget.idJenjang}"),
              // Text("${widget.kodeHalaqoh}"),
              FutureBuilder(
                future: RemoteServices.filterhSantri(SpUtil.getString('token')!,
                    widget.kodeHalaqoh, widget.idJenjang),
                builder: (context, AsyncSnapshot snapshot) {
                  return Container(
                    width: width,
                    height: height / 2,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CardPenilaianSantri(
                            santri: snapshot.data[index]);
                      },
                    ),
                  );
                },
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
