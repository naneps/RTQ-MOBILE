import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/controllers/halaqoh_controllers.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/views/asatidz/penilaian/components/card_jenjang.dart';
import 'package:tahfidz/views/asatidz/penilaian/components/drop_down_cabang.dart';
import 'package:tahfidz/views/asatidz/penilaian/list_santri_scren.dart';

class JenjangScreen extends StatefulWidget {
  const JenjangScreen({Key? key}) : super(key: key);

  @override
  State<JenjangScreen> createState() => _JenjangScreenState();
}

class _JenjangScreenState extends State<JenjangScreen> {
  final JenjangController jenjangController = Get.put(JenjangController());
  HalaqohController halaqohController = Get.put(HalaqohController());

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
              // alignment: Alignment.center,
              width: width,
              // height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: DropwDownCabang(),
            ),
            SizedBox(
              height: 15,
            ),
            // Text("${halaqohController.getSelectedHalaqoh().namaDaerah}"),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Daftar Jenjang ",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: Container(
                width: width,
                height: height,
                child: Obx(
                  () {
                    if (jenjangController.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: jenjangController.listJenjang.length,
                        itemBuilder: (context, index) {
                          print(jenjangController.listJenjang[index].jenjang);
                          return CardJenjang(
                            nomor: index,
                            onTap: () async {
                              await Get.to(ListSantriScreen(
                                idJenjang: jenjangController
                                    .listJenjang[index].id
                                    .toString(),
                                kodeHalaqoh: halaqohController
                                    .getSelectedHalaqoh()
                                    .kodeHalaqah,
                              ));
                            },
                            jenjang: jenjangController.listJenjang[index],
                          );
                        },
                      );
                    }
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
