import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/components/constants.dart';

class CardJenjang extends StatelessWidget {
  dynamic onTap;
  String? title;
  CardJenjang({this.title, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        height: 90,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(29))),
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
              child: Icon(
                LineIcons.bookOpen,
                size: 34,
                color: mainColor,
              ),
            ),
            Expanded(
              // flex: 5,
              child: Container(),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: greyColor),
                  ),
                  Text(
                    "Pelajaran",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyColor),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(),
            ),
            Container(
              height: 50,
              width: 50,
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
