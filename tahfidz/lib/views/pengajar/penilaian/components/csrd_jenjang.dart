import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/model/Jenjang.dart';

class CardJenjang extends StatelessWidget {
  final Jenjang? jenjang;
  final int? nomor;
  dynamic onTap;

  CardJenjang({Key? key, this.jenjang, this.nomor, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    int count = 1;
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        height: 90,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(35))),
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
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        "${jenjang!.namaKelas}",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: greyColor),
                      ),
                    ),
                    Text(
                      "Pelajaran",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: greyColor),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 30,
                width: 100,
                margin: EdgeInsets.only(left: 50, right: 10),
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  "${jenjang!.countSantri!.length.toString()} Santri",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                )),
              ),
            ),
            Container(
              // height: 50,
              // width: 50,
              child: GestureDetector(
                onTap: onTap,
                child: Icon(
                  LineIcons.alternateLongArrowRight,
                  color: Colors.black,
                  size: 34,
                ),
              ),
            ),
          ],
        )
        // child: ,
        );
  }
}
