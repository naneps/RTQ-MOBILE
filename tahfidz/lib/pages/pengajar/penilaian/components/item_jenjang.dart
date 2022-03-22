import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';

class CardJenjang extends StatelessWidget {
  const CardJenjang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(29))),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [Text("Kelas"), Text("Titile")],
                ),
              ),
            )
          ],
        )
        // child: ,
        );
  }
}
