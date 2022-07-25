import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/data/helper.dart';

class CardAbsensi extends StatelessWidget {
  const CardAbsensi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: List.generate(keteranganAbsen.length, (index) {
            print(keteranganAbsen[index]['keterangan']);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    // color: keteranganAbsen[index]['color'],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: keteranganAbsen[index]['icon'],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(keteranganAbsen[index]['keterangan'],
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kFontColor,
                    )),
              ],
            );
          }),
        ),
      ),
    );
  }
}
