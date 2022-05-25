import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/data/dumy+data.dart';
import 'package:tahfidz/model/Jenjang.dart';
import 'package:tahfidz/model/kategori_penilaian.dart';
import 'package:tahfidz/model/santri_by.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/asatidz/penilaian/pelajaran_screen.dart';

class CardPenilaianSantri extends StatelessWidget {
  SantriBy santri;
  String idJenjang;
  CardPenilaianSantri({required this.santri, required this.idJenjang, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 2),
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 1)
          ]),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Container(
              height: size.height,
              // color: mainColor,
              width: size.width,
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${santri.namaLengkap}",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: greyColor),
                      ),
                      Row(
                        children: [
                          Text(
                            "${santri.jenjang}",
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: greyColor),
                          ),
                          Text(
                            " | ",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: mainColor),
                          ),
                          Flexible(
                            child: Text(
                              "${santri.namaHalaqah}",
                              style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: greyColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: -1,
            child: Container(
              // height: 50,
              // width: 30,
              // color: Colors.black,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: FutureBuilder(
                        future: RemoteServices.fetchKategoriPenilaian(
                            SpUtil.getString('token')!),
                        builder: (context, AsyncSnapshot snapshot) {
                          print('data kategori ${snapshot.data}');
                          // double value = snapshot.data.length!;
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                  // value: double.parse(snapshot.data.length!),

                                  backgroundColor: Colors.white,
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(mainColor)),
                            );
                          }
                          // print(snapshot.data);
                          return ListView.builder(
                              // scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length!,
                              itemBuilder: (context, index) {
                                KategoriPenilaian kategori =
                                    snapshot.data[index];
                                // print(kategori);
                                return TextButton(
                                  onPressed: () {
                                    Get.to(PelajaranScreen(), arguments: [
                                      kategori,
                                      idJenjang,
                                      santri
                                    ]);
                                  },
                                  child: Text(
                                    "${kategori.kategoriPenilaian}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 42, 231, 0)),
                                  ),
                                );
                              });
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildBtnPenilaianTadribat(BuildContext context, index) {
  //   final size = MediaQuery.of(context).size;
  //   double nilai = 0;
  //   int count = 1;
  //   return TextButton(
  //     onPressed: () {
  //       Get.defaultDialog(
  //           content: Container(
  //             width: size.width,
  //             height: size.height / 2,
  //             // color: mainColor,
  //             child: ListView.builder(
  //               itemCount: 10,
  //               itemBuilder: (context, index) {
  //                 return Container(
  //                   margin: EdgeInsets.only(bottom: 10),
  //                   child: ListTile(
  //                     dense: true,
  //                     trailing: Container(
  //                       width: 100,
  //                       height: 90,
  //                       // color: Colors.black,
  //                       child: Center(
  //                         child: Column(
  //                           children: [
  //                             Slider(
  //                                 min: 0,
  //                                 max: 100,
  //                                 value: nilai,
  //                                 // divisions: 4,
  //                                 label: "$nilai",
  //                                 onChanged: (value) {
  //                                   nilai = value;
  //                                 }),
  //                             Text("$nilai"),
  //                           ],
  //                         ),
  //                       ),
  //                     ), // trailing: TextField(),

  //                     leading: Stack(
  //                       alignment: Alignment.center,
  //                       children: [
  //                         Image.asset(
  //                           'assets/nomor.png',
  //                           width: 40,
  //                           height: 40,
  //                           fit: BoxFit.cover,
  //                         ),
  //                         Text(
  //                           "${count + index}",
  //                           style: GoogleFonts.poppins(fontSize: 14),
  //                         )
  //                       ],
  //                     ),
  //                     title: Text("Pelajaran ${count + index}"),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //           title: "Penilaian Tadribat",
  //           barrierDismissible: false,
  //           cancel: IconButton(
  //               onPressed: () => Get.back(), icon: Icon(Icons.close)));
  //     },
  //     child: Text(
  //       "Tadribat",
  //       style: GoogleFonts.poppins(color: mainColor),
  //     ),
  //     // icon: Icon(Icons.abc_outlined),
  //   );
  // }

  // Widget buildBtnHaflan(BuildContext context, id) {
  //   final size = MediaQuery.of(context).size;
  //   int count = 1;
  //   return TextButton(
  //     onPressed: () {
  //       Get.defaultDialog(
  //         content: Container(
  //           width: size.width,
  //           height: size.height / 2,
  //           // color: mainColor,
  //           child: ListView.builder(
  //             itemCount: 10,
  //             itemBuilder: (context, index) {
  //               return Container(
  //                 margin: EdgeInsets.only(bottom: 10),
  //                 child: ListTile(
  //                   // dense: true,
  //                   trailing: Container(
  //                     width: 60,
  //                     height: 40,
  //                     // color: Colors.white,
  //                     child: Center(
  //                       child: Text("80"),
  //                     ),
  //                   ), // trailing: TextField(),

  //                   leading: Stack(
  //                     alignment: Alignment.center,
  //                     children: [
  //                       Image.asset(
  //                         'assets/nomor.png',
  //                         width: 40,
  //                         height: 40,
  //                         fit: BoxFit.cover,
  //                       ),
  //                       Text(
  //                         "${count + index}",
  //                         style: GoogleFonts.poppins(fontSize: 14),
  //                       )
  //                     ],
  //                   ),
  //                   title: Text("Hafalan ${count + index}"),
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //         title: "Penilaian Hafalan",
  //         barrierDismissible: false,
  //         confirm:
  //             IconButton(onPressed: () => Get.back(), icon: Icon(Icons.save)),
  //         cancel: IconButton(
  //           onPressed: () => Get.back(),
  //           icon: Icon(Icons.close),
  //         ),
  //       );
  //     },
  //     child: Text("Hafalan"),
  //   );
  // }
}
