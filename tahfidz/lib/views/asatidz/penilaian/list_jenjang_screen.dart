import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/controllers/halaqoh_controllers.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/data/helper.dart';
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
        title: Text(
          "Penilaian Santri",
          style: GoogleFonts.poppins(
              // letterSpacing: 2,
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: kMainColor,
      body: Container(
        color: mainColor,
        padding: const EdgeInsets.all(20),
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
              child: DropwDownCabang(
                onChange: (value) {
                  setState(() {
                    halaqohController.setSelectedHalaqoh(value);
                  });
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Text("${halaqohController.getSelectedHalaqoh().namaDaerah}"),

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
            Expanded(
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
                        // print(jenjangController.listJenjang[index].jenjang);
                        return CardJenjang(
                          nomor: index,
                          onTap: () async {
                            // ignore: unnecessary_null_comparison
                            if (halaqohController
                                    .getSelectedHalaqoh()
                                    .kodeHalaqah ==
                                null) {
                              Get.snackbar(
                                "Peringatan",
                                "Pilih Cabang Dahulu",
                                icon: const Icon(
                                  Icons.error,
                                  color: Colors.white,
                                ),
                                // snackStyle: SnackStyle.,
                                backgroundColor: redColor,
                                colorText: Colors.white,
                                borderRadius: 10,
                                snackPosition: SnackPosition.TOP,
                                duration: const Duration(seconds: 2),
                              );
                            } else {
                              await Get.to(ListSantriScreen(), arguments: [
                                jenjangController.listJenjang[index].id
                                    .toString(),
                                halaqohController
                                    .getSelectedHalaqoh()
                                    .kodeHalaqah,
                              ]);
                            }
                          },
                          jenjang: jenjangController.listJenjang[index],
                          countPelajaran: getTotalPelajaran(jenjangController
                              .listJenjang[index].id
                              .toString()),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
