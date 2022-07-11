import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/data/helper.dart';
import 'package:tahfidz/model/santri_by.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/asatidz/penilaian/pelajaran_screen.dart';

class CardAbsensiSantri extends StatefulWidget {
  SantriBy santri;
  String? idJenjang;
  CardAbsensiSantri({required this.santri, this.idJenjang, Key? key})
      : super(key: key);

  @override
  State<CardAbsensiSantri> createState() => _CardAbsensiSantriState();
}

class _CardAbsensiSantriState extends State<CardAbsensiSantri> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                offset: const Offset(2, 2),
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 1)
          ]),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Container(
              height: size.height,
              // color: mainColor,
              width: size.width,
              margin: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.santri.namaLengkap}",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: greyColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: -1,
            child: Center(
              child: Container(
                  height: 50,
                  width: 100,
                  child: FutureBuilder(
                    future: RemoteServices.getAbsenSantri(
                        idSantri: widget.santri.id),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return TextButton(
                          onPressed: () {
                            Get.bottomSheet(Container(
                              padding: const EdgeInsets.all(15),
                              height: 159,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Text(
                                    "Ubah Keterangan",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: List.generate(
                                      keteranganAbsen.length,
                                      (index) => IconButton(
                                        onPressed: () async {
                                          await RemoteServices.putAbsenSantri(
                                                  idAbsensi: snapshot
                                                      .data['id_absensi'],
                                                  statusAbsen:
                                                      keteranganAbsen[index]
                                                          ['id'])
                                              .then((value) {
                                            if (value == true) {
                                              // Get.back();
                                              setState(() {});
                                              Get.back();
                                            }
                                          });
                                        },
                                        icon: SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: keteranganAbsen[index]
                                                ['icon']),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ));
                          },
                          child: buildIndikator(snapshot.data['keterangan']));
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }

  buildIndikator(String keterangan) {
    for (var element in keteranganAbsen) {
      if (element['keterangan'] == keterangan) {
        return element['icon'];
      }
    }
  }
}
