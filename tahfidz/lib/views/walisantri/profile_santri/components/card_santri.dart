// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/views/walisantri/iuran/iuran_screen.dart';
import 'package:tahfidz/views/walisantri/prestasi/rekap_nilai.dart';
import 'package:tahfidz/views/walisantri/prestasi/sertifikat_screen.dart';
import 'package:tahfidz/views/walisantri/profile_santri/components/widget_button.dart';

class CardSantri extends StatelessWidget {
  CardSantri({
    Key? key,
    this.id,
    required this.size,
    this.nama,
    this.nis,
    this.halaqoh,
    this.foto,
    // this.onTap,
    this.id_jenjang,
    this.jenjang,
    // this.fotoS
  }) : super(key: key);

  final Size size;
  String? id;
  String? id_jenjang;
  String? nama;

  String? jenjang;
  String? halaqoh;
  String? foto;
  String? nis;
  // String? fotoSantri;

  // VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
      width: size.width,
      height: size.width - 60,
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: const [
          BoxShadow(
              offset: Offset(1, 3),
              blurRadius: 5,
              color: Color.fromRGBO(0, 0, 0, 0.25))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 55,
            backgroundColor: mainColor,
            child: CircleAvatar(
              foregroundColor: Color.fromRGBO(200, 22, 23, 1),
              backgroundImage: NetworkImage(foto ??
                  'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?t=st=1655228023~exp=1655228623~hmac=2342e4f3e12010bfbeaf89dbfbc3be90a0e24349a2aac761c57ecd3a8c6d113d&w=740'),
              radius: 50,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            nama ?? "",
            style: GoogleFonts.poppins(
                fontSize: 16, fontWeight: FontWeight.w600, color: kFontColor),
          ),
          Text(
            nis ?? "",
            style: GoogleFonts.poppins(
                fontSize: 16, fontWeight: FontWeight.w600, color: kFontColor),
          ),
          Text(
            jenjang ?? "",
            style: GoogleFonts.poppins(
                fontSize: 12, fontWeight: FontWeight.w500, color: kFontColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WudgetButton(
                ontap: () {
                  Get.to(const RekapNilaiScreen(), arguments: {'id': id});
                },
                label: "Rekap Nilai",
                color: const Color.fromARGB(255, 82, 116, 251),
              ),
              WudgetButton(
                ontap: () {
                  Get.to(SertifikatScreen(),
                      arguments: {'id': id, 'nama': nama});
                },
                label: "Sertifikat",
                color: const Color.fromARGB(255, 0, 206, 185),
              ),
              WudgetButton(
                ontap: () {
                  Get.to(IuranScreen(), arguments: {'id': id, 'nama': nama});
                },
                label: "Rekap Iuran",
                color: const Color.fromARGB(255, 0, 206, 27),
              ),
              // WudgetButton(),
            ],
          )
        ],
      ),
    );
  }
}
