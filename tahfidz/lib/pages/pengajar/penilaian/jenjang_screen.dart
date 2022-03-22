import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/search_box.dart';
import 'package:tahfidz/components/splashScreen.dart';
import 'package:tahfidz/pages/pengajar/penilaian/components/item_jenjang.dart';
import 'package:tahfidz/pages/pengajar/penilaian/pelajara_screen.dart';

class PenilaianScreen extends StatefulWidget {
  const PenilaianScreen({Key? key}) : super(key: key);

  @override
  State<PenilaianScreen> createState() => _PenilaianScreenState();
}

class _PenilaianScreenState extends State<PenilaianScreen> {
  List<String> _listJenjang = List.generate(8, (index) => "Jenjang $index");
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: mainColor,
        title: Text(" Jenjang "),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: mainColor,
        height: height,
        width: width,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Daftar Jenjang ",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SearchBox(
              labelText: "Cari Jenjang",
            ),
            Flexible(
              child: Container(
                width: width,
                height: 500,
                child: ListView.builder(
                  itemCount: _listJenjang.length,
                  itemBuilder: (context, index) {
                    return CardJenjang(
                      title: _listJenjang[index],
                      onTap: () {
                        // print('$index');
                        Get.to(PelajaranScreen(
                          id: '${_listJenjang[index]}',
                        ));
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
