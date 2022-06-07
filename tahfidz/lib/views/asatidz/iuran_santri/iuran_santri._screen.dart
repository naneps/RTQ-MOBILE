import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/controllers/halaqoh_controllers.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/asatidz/iuran_santri/list_iuran_santri.dart';
import 'package:tahfidz/views/asatidz/penilaian/components/card_jenjang.dart';
import 'package:tahfidz/views/asatidz/penilaian/components/drop_down_cabang.dart';
import 'package:tahfidz/views/asatidz/penilaian/list_santri_scren.dart';

class IuranSantriScreen extends StatefulWidget {
  const IuranSantriScreen({Key? key}) : super(key: key);

  @override
  State<IuranSantriScreen> createState() => _IuranSantriScreenState();
}

class _IuranSantriScreenState extends State<IuranSantriScreen> {
  bool checked = false;
  HalaqohController halaqohController = Get.put(HalaqohController());
  JenjangController jenjangController = Get.put(JenjangController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: Text(
          "Iuran Santri",
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // alignment: Alignment.center,
              width: Get.width,
              // height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: DropwDownCabang(),
            ),
            Text(
              "Validasi Iuran Santri",
              style: GoogleFonts.poppins(
                  color: greyColor, fontSize: 18, fontWeight: FontWeight.bold),
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
                              await Get.to(ListIuranSantri(), arguments: {
                                'id_jenjang': jenjangController
                                    .listJenjang[index].id
                                    .toString(),
                                'kd_halaqoh': halaqohController
                                    .getSelectedHalaqoh()
                                    .kodeHalaqah
                              });
                            }
                          },
                          jenjang: jenjangController.listJenjang[index],
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

class CardIuran extends StatelessWidget {
  const CardIuran({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      width: size.width,
      // height: 60,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            child: Checkbox(
              value: false,
              onChanged: (value) {
                // setState(() {
                //   // checked = value!;
                // });
              },
            ), //Ch
          ),
          Container(
            width: 40,
            height: 40,
            color: Colors.blueAccent,
            child: LineIcon.alternateMoneyBill(
              color: Colors.white,
              size: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ahmad",
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sudfah divalidasi",
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "2000",
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
