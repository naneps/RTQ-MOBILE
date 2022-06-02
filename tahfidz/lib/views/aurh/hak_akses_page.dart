import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/data/dumy+data.dart';
import 'package:tahfidz/views/aurh/components/wodget_hal_akses.dart';
import 'package:tahfidz/views/aurh/login_page.dart';

class HakAksesPage extends StatefulWidget {
  const HakAksesPage({Key? key}) : super(key: key);

  @override
  State<HakAksesPage> createState() => _HakAksesPageState();
}

class _HakAksesPageState extends State<HakAksesPage> {
  // bool iSelected = false;
  int? selectedIndex;
  dynamic selectedHakAkses;
  // final _formKey = GlobalKey<ElevatedB>();
  bool isButtonActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 6,
              child: SizedBox(),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20, top: 20),
              child: Text(
                "RTQ APP",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kFontColor,
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              child: Text("Pilih Hak Akses",
                  style: GoogleFonts.poppins(
                      color: kFontColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w800)),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Masuk Sebagai apakah Adna hayoo ???",
                style: GoogleFonts.poppins(
                  color: kFontColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: const SizedBox(),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 200,
              // color: Colors.amber,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: datahakAkses.length,
                itemBuilder: (context, index) {
                  datahakAkses[index]['id'];
                  return WidgetHakAkses(
                    isSelected: selectedIndex == index ? true : false,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedHakAkses = datahakAkses[index];
                      });
                      // print(datahakAkses[index]['id']);
                    },
                    // isSelected: false,
                    id: datahakAkses[index]['id'].toString(),
                    title: datahakAkses[index]['hakAkses'],
                  );
                },
              ),
            ),

            // Text("Pilih HakAkses),
            const Expanded(
              flex: 6,
              child: SizedBox(),
            ),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isButtonActive = false;
                  });

                  if (selectedHakAkses == null) {
                    Get.snackbar(
                      'Peringatan',
                      'Pilih Hak Akses Terlebih Dahulu',
                      icon: Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      backgroundColor: Colors.white,
                      colorText: Colors.black,
                      borderRadius: 10,
                      snackPosition: SnackPosition.BOTTOM,
                      margin: EdgeInsets.all(10),
                      duration: Duration(seconds: 2),
                    );
                  } else {
                    Get.to(LoginPage(), arguments: selectedHakAkses);
                  }
                },
                child: SizedBox(
                    width: Get.width,
                    child: Text(
                      "Selanjutnya",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ))),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
