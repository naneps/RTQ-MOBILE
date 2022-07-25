import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/search_box.dart';
import 'package:tahfidz/components/widget_empty.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/asatidz/penilaian/components/card_santri.dart';

class ListSantriScreen extends StatefulWidget {
  // String? id;

  ListSantriScreen({Key? key}) : super(key: key);

  @override
  State<ListSantriScreen> createState() => _ListSantriScreenState();
}

class _ListSantriScreenState extends State<ListSantriScreen> {
  JenjangController jenjangController = Get.put(JenjangController());
  final args = Get.arguments;
  // var idJenjang = args[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        // shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Penilaian Santri',
          style: GoogleFonts.poppins(
            // letterSpacing: 2,
            fontSize: 16,
            color: kFontColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: Get.width,
          height: Get.height,
          // padding: EdgeInsets.all(10),
          // color: Colors.black,

          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBox(
                labelText: "Cari Santri",
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      "Daftar Santri ",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kFontColor),
                    ),
                    Text(
                      " | ",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              // Text(args[1]),
              // Text("${widget.idJenjang}"),
              // Text("${widget.kodeHalaqoh}"),
              FutureBuilder(
                future: RemoteServices.filterSantri(
                  kdHalaqoh: args[1],
                  idJenjang: args[0],
                ),
                builder: (context, AsyncSnapshot snapshot) {
                  // print(snapshot.data);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.yellow,
                        strokeWidth: 10,
                        // value: 1,
                        color: mainColor,
                      ),
                    );
                  } else if (!snapshot.hasData) {
                    return Center(child: WidgetEmptySantri());
                  }
                  return SizedBox(
                    width: Get.width,
                    height: Get.height / 1.5,
                    child: ListView.builder(
                      itemCount: snapshot.data.length ?? 0,
                      itemBuilder: (context, index) {
                        return CardPenilaianSantri(
                            idJenjang: args[0], santri: snapshot.data[index]);
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
