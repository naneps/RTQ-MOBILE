import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/views/pengajar/penilaian/components/csrd_jenjang.dart';
import 'package:tahfidz/views/pengajar/penilaian/components/drop_down_cabang.dart';
import 'package:tahfidz/views/pengajar/penilaian/list_santri_scren.dart';

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
              width: width,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: DropwDownCabang(),
            ),
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
                          return CardJenjang(
                            nomor: index,
                            onTap: () async {
                              await Get.to(ListSantriScreen(
                                jenjang: jenjangController.listJenjang[index],
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
