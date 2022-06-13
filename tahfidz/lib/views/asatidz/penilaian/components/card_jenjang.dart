import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/controllers/halaqoh_controllers.dart';
import 'package:tahfidz/data/helper.dart';
import 'package:tahfidz/model/Jenjang.dart';

class CardJenjang extends StatelessWidget {
  final Jenjang? jenjang;
  final int? nomor;
  dynamic onTap;

  CardJenjang({Key? key, this.jenjang, this.nomor, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HalaqohController halaqohController = Get.put(HalaqohController());
    int count = 1;
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(const Radius.circular(35))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/nomor.png',
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "${count + nomor!}",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  // width: 400,
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "${jenjang!.jenjang}",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: greyColor),
                        ),
                      ),
                      FutureBuilder(
                        future: getTotalPelajaran(jenjang!.id.toString()),
                        builder: (context, snapshot) {
                          print(snapshot.data);
                          return Text(
                            "Pelajaran : ${snapshot.data}",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: greyColor),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: FutureBuilder<String>(
                  future: getTotalSantriIn(
                      idJenjang: jenjang!.id.toString(),
                      kdHalaqoh:
                          halaqohController.getSelectedHalaqoh().kodeHalaqah),
                  builder: (context, snapshot) {
                    // print(snapshot.data);
                    if (!snapshot.hasData) {
                      return Container(
                        // height: 100,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 30, right: 10),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 179, 194, 255),
                            borderRadius: BorderRadius.circular(30)),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Jumlah Santri ',
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: kFontColor),
                              ),
                              TextSpan(
                                text: "0",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: kFontColor),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    String totalSantri = snapshot.data.toString();
                    return Container(
                      // height: 100,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 30, right: 10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 202, 255, 179),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Jumlah Santri ',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: kFontColor),
                            ),
                            TextSpan(
                              text: totalSantri,
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: kFontColor),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            ],
          )
          // child: ,
          ),
    );
  }
}
