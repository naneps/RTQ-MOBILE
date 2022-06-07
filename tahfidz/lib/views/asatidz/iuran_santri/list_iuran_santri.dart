import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/custom_text_field.dart';
import 'package:tahfidz/services/remote_services.dart';

class ListIuranSantri extends StatelessWidget {
  ListIuranSantri({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var argumen = Get.arguments;
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
                                  SizedBox(
                                    width: 100,
                                    child: CustomTextField(
                                      // hintText: "Nominal",
                                      labelText: "Nominal",
                                      inputType: TextInputType.number,
                                    ),
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
              },
            ))
          ],
        ),
      ),
    );
  }
}
