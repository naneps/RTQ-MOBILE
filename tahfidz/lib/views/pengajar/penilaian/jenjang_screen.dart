import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/search_box.dart';
import 'package:tahfidz/components/splashScreen.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/model/Jenjang.dart';
import 'package:tahfidz/views/pengajar/penilaian/components/csrd_jenjang.dart';
import 'package:tahfidz/views/pengajar/penilaian/santri_in_jenjang_screen.dart';

class PenilaianScreen extends StatefulWidget {
  const PenilaianScreen({Key? key}) : super(key: key);

  @override
  State<PenilaianScreen> createState() => _PenilaianScreenState();
}

class _PenilaianScreenState extends State<PenilaianScreen> {
  final JenjangController jenjangController = Get.put(JenjangController());
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
                height: height,
                child: Obx(() {
                  if (jenjangController.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else
                    return ListView.builder(
                        itemCount: jenjangController.listJenjang.length,
                        itemBuilder: (context, index) {
                          return CardJenjang(
                            nomor: index,
                            onTap: () async {
                              await Get.to(PelajaranScreen(
                                jenjang: jenjangController.listJenjang[index],
                              ));
                            },
                            jenjang: jenjangController.listJenjang[index],
                          );
                        });
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
