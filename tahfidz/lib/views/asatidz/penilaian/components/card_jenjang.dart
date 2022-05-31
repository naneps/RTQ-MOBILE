import 'package:flutter/material.dart';
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
                width: 150,
                margin: EdgeInsets.only(left: 50, right: 10),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  "10 Santri }",
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
              child: IconButton(
                onPressed: onTap,
                icon: Icon(
                  LineIcons.alternateLongArrowRight,
                  color: Color.fromARGB(255, 0, 0, 0),
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
