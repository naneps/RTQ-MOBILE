import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/dropdown_jenjang.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/model/kategori_penilaian.dart';
import 'package:tahfidz/model/pelajaran.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/walisantri/prestasi/components/widget_pelajaran.dart';

class RekapNilaiScreen extends StatefulWidget {
  const RekapNilaiScreen({Key? key}) : super(key: key);

  @override
  State<RekapNilaiScreen> createState() => _RekapNilaiScreenState();
}

class _RekapNilaiScreenState extends State<RekapNilaiScreen> {
  JenjangController jenjangController = Get.put(JenjangController());
  List<KategoriPenilaian>? listKategoriPenilaian = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    RemoteServices.fetchKategoriPenilaian(SpUtil.getString('token')!)
        .then((value) {
      value.forEach((element) {
        listKategoriPenilaian!.add(element);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: M,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: DropdownJenjang(
                onChange: (data) {
                  setState(() {
                    jenjangController.setSelectedJenjang(data);
                  });
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "${(jenjangController.getSelectedJenjang().id == null ? "" : "Rekap Nilai ${jenjangController.getSelectedJenjang().jenjang ?? ""}")} ",
              style: GoogleFonts.poppins(
                  color: kFontColor, fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            (jenjangController.getSelectedJenjang().id == null)
                ? Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: kMainColor.withBlue(130),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      // margin: ,
                      padding: const EdgeInsets.all(15),
                      margin: EdgeInsets.only(top: Get.height / 4),

                      child: Text(
                        "Pilih Jenjang Terlebih Dahulu",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                : Expanded(
                    child: Container(
                      child: ListView.builder(
                          itemCount: listKategoriPenilaian!.length,
                          itemBuilder: (context, index) {
                            if (listKategoriPenilaian == null) {
                              return Container();
                            } else {
                              return Column(
                                // mainAxisAlignment: M,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hasil Penilaian ${listKategoriPenilaian![index].kategoriPenilaian ?? ""}",
                                    style: GoogleFonts.poppins(
                                        color: kFontColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  FutureBuilder<List<Pelajaran>?>(
                                      future: RemoteServices.filterPelajaran(
                                        token: SpUtil.getString('token'),
                                        idJenjang: jenjangController
                                            .getSelectedJenjang()
                                            .id
                                            .toString(),
                                        idKategoriPenilaian:
                                            listKategoriPenilaian![index]
                                                .id
                                                .toString(),
                                      ),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 191, 191, 191),
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      mainColor),
                                            ),
                                          );
                                        } else if (snapshot.hasData) {
                                          return SizedBox(
                                            // color: Colors.amberAccent,
                                            height: Get.height / 2,
                                            width: double.infinity,
                                            child: ListView.builder(
                                              itemCount: snapshot.data?.length,
                                              itemBuilder: (context, index) {
                                                Pelajaran pelajaran =
                                                    snapshot.data![index];
                                                return WidgetPelajaran(
                                                  nomor: index + 1,
                                                  pelajaran: pelajaran,
                                                );
                                              },
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            height: 50,
                                            padding: EdgeInsets.all(10),
                                            color: Color.fromARGB(
                                                255, 234, 96, 87),
                                            // height: 200,
                                            width: Get.width,
                                            child: Text(
                                              "Data Pelajaran La",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          );
                                        }
                                      })
                                ],
                              );
                            }
                          }),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
