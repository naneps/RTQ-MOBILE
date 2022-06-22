import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/dropdown_jenjang.dart';

import 'package:tahfidz/controllers/halaqoh_controllers.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/model/Jenjang.dart';
import 'package:tahfidz/model/halaqoh.dart';
import 'package:tahfidz/model/santri.dart';

import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/asatidz/absensi/components/card_santri.dart';

import 'package:tahfidz/views/asatidz/absensi/components/widget_indicator.dart';
import 'package:tahfidz/views/asatidz/penilaian/components/drop_down_cabang.dart';

import '../../../components/widget_empty.dart';
import '../../../model/santri_by.dart';

class AbsensiScreen extends StatefulWidget {
  const AbsensiScreen({Key? key}) : super(key: key);

  @override
  State<AbsensiScreen> createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  Color? absenColor;
  String selectAbsen = 'hadir';

  @override
  Widget build(BuildContext context) {
    JenjangController jenjangController = Get.put(JenjangController());
    HalaqohController halaqohController = Get.put(HalaqohController());
    Jenjang selectedJenjang = jenjangController.getSelectedJenjang();
    Halaqoh selectedCabang = halaqohController.getSelectedHalaqoh();

    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        // shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          "Absensi",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: IndicatorAbsen(widhtBody: Get.width),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: DropwDownCabang(
                onChange: (value) {
                  setState(() {
                    halaqohController.setSelectedHalaqoh(value);
                  });
                },
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownJenjang(
                onChange: (jenjang) {
                  setState(() {
                    jenjangController.setSelectedJenjang(jenjang);
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: (selectedCabang.kodeHalaqah == null ||
                      selectedJenjang.id == null)
                  ? Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        // padding: EdgeInsets.all(15),
                        // color: const Color.fromARGB(255, 193, 226, 255),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/santri.png',
                              scale: 2,
                            ),
                            Text(
                              "Pilih Cabang dan Jenjang Terlebih Dahulu",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: kFontColor),
                            )
                          ],
                        ),
                      ),
                    )
                  : FutureBuilder(
                      future: RemoteServices.cekAbsensiSantri(
                          idJenjang: jenjangController
                              .getSelectedJenjang()
                              .id
                              .toString(),
                          kdHalaqoh: halaqohController
                              .getSelectedHalaqoh()
                              .kodeHalaqah),
                      builder: (context, AsyncSnapshot snapshot) {
                        // print(snapshot.data);
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        } else if (snapshot.hasData) {
                          if (snapshot.data.isEmpty) {
                            return Center(
                              child: TextButton(
                                onPressed: () async {
                                  await RemoteServices.createAbsensiSantri(
                                      idJenjang: jenjangController
                                          .getSelectedJenjang()
                                          .id
                                          .toString(),
                                      kdHalaqoh: halaqohController
                                          .getSelectedHalaqoh()
                                          .kodeHalaqah);
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: greenColor,
                                      borderRadius: BorderRadius.circular(16)),
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    "Buat Absen Santri !",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16, color: kFontColor),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            // return)
                            return FutureBuilder<List<SantriBy>?>(
                              future: RemoteServices.filterSantri(
                                  kdHalaqoh: halaqohController
                                      .getSelectedHalaqoh()
                                      .kodeHalaqah,
                                  idJenjang: jenjangController
                                      .getSelectedJenjang()
                                      .id
                                      .toString()),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container();
                                } else if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) =>
                                        CardAbsensiSantri(
                                            santri: snapshot.data![index]),
                                  );
                                }
                                return const WidgetEmptySantri();
                              },
                            );
                          }
                          // if (snapshot.data) {
                          //   print("belum absensi santri");

                          // }
                        } else if (!snapshot.hasData) {
                          print("Data Kosong");
                        }
                        return Container();
                      },
                    ))
        ],
      ),
    );
  }

  void _onButtonPressed(Santri santri) {
    bool _isAccepted = false;
    Color hadir = Colors.green;
    Color izin = Colors.blue;
    Color sakit = Colors.yellow;
    Color alpa = Colors.red;
    showModalBottomSheet(
      // shape: RoundedRectangleBorder(),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => selectedItem(hadir, santri),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Material(
                    color: hadir,
                    shape: const StadiumBorder(),
                    elevation: 4,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Material(
                  color: izin,
                  shape: const StadiumBorder(),
                  elevation: 4,
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Material(
                  color: sakit,
                  shape: const StadiumBorder(),
                  elevation: 4,
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Material(
                  color: alpa,
                  shape: const StadiumBorder(),
                  elevation: 4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void selectedItem(Color color, Santri santri) {
    setState(() {
      absenColor = color;
    });
    // dispose();
  }
}
