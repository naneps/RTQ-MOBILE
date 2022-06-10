import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/custom_text_field.dart';
import 'package:tahfidz/controllers/iuran_controller.dart';
import 'package:tahfidz/data/helper.dart';
import 'package:tahfidz/model/iuran.dart';
import 'package:tahfidz/services/remote_services.dart';

class ListIuranSantri extends StatelessWidget {
  ListIuranSantri({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var argumen = Get.arguments;
    IuranController controller = Get.put(IuranController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Iuran Santri',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Daftar Santri",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: FutureBuilder(
              future: RemoteServices.filterSantri(
                idJenjang: argumen['id_jenjang'],
                token: SpUtil.getString('token'),
                kdHalaqoh: argumen['kd_halaqoh'],
              ),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                // height: 50,
                                width: Get.height,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        offset: Offset(1, 1))
                                  ],
                                ),
                                // color: Colors.amberAccent,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "${snapshot.data[index].namaLengkap}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Text("${snapshot.data[index].namaLengkap}"),
                                    FutureBuilder(
                                      future: RemoteServices.getNominalIuran(
                                        snapshot.data[index].id.toString(),
                                      ),
                                      builder: (context,
                                          AsyncSnapshot snapshotIuran) {
                                        // print(snapshotIuran.data['nominal']);
                                        if (snapshotIuran.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      Color.fromARGB(
                                                          255, 96, 33, 243)),
                                            ),
                                          );
                                        } else if (snapshotIuran.hasData) {
                                          return Text(
                                            formatRupiah(
                                              int.parse(
                                                snapshotIuran.data['nominal'],
                                                // "1000000",
                                              ),
                                            ),
                                          );
                                        } else if (!snapshotIuran.hasData) {
                                          return TextButton(
                                              onPressed: () {
                                                showInputIuran(
                                                    idSantri:
                                                        snapshot.data[index].id,
                                                    nominal: controller
                                                        .iuranController.text,
                                                    controller: controller
                                                        .iuranController);
                                              },
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.add),
                                                    Text("Tambah Iuran")
                                                  ],
                                                ),
                                              ));
                                        } else {
                                          return Container();
                                        }
                                        // return Container();
                                      },
                                    )
                                    // Text("${snapshot.data[index].namaLengkap}"),
                                  ],
                                ));
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                              kMainColor,
                            ),
                          ),
                        );
                }
              },
            )),
          ],
        ),
      ),
    );
  }

  showInputIuran(
      {String? idSantri, String? nominal, TextEditingController? controller}) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(15),
        height: Get.height / 4,
        color: Colors.white,
        child: Column(
          children: [
            const Text("Tambah Iuran"),
            CustomTextField(
              hintText: "Nominal",
              labelText: "Nominal",
              controller: controller,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Batal")),
                ElevatedButton(
                  onPressed: () async {
                    await RemoteServices.storeIuran(
                      idSantri: idSantri,
                      nominal: nominal,
                    ).then(
                      (value) {
                        print(value);
                        if (value == true) {
                          Get.back();
                          Get.snackbar("Berhasil", "Berhasil menambahkan iuran",
                              backgroundColor: Colors.green);
                        }
                      },
                    );
                  },
                  child: const Text("Simpan"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
