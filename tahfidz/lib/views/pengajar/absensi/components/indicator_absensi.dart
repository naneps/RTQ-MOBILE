import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';

class CardAbsensi extends StatelessWidget {
  CardAbsensi({Key? key}) : super(key: key);
  Color hadir = Colors.green;
  Color izin = Colors.blue;
  Color sakit = Colors.yellow;
  Color alpa = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: mainColor,
      elevation: 1,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisSize: MainAxisSize.min,

          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Draggable(
                  feedback: SizedBox(
                    width: 40,
                    height: 40,
                    child: Material(
                      color: hadir.withOpacity(0.5),
                      shape: StadiumBorder(),
                      elevation: 4,
                    ),
                  ),
                  data: hadir,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Material(
                      color: hadir,
                      shape: StadiumBorder(),
                      elevation: 4,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Hadir",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: greyColor))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Draggable(
                  feedback: SizedBox(
                    width: 40,
                    height: 40,
                    child: Material(
                      color: izin.withOpacity(0.5),
                      shape: StadiumBorder(),
                      elevation: 4,
                    ),
                  ),
                  data: izin,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Material(
                      color: izin,
                      shape: StadiumBorder(),
                      elevation: 4,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Izin",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: greyColor))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Draggable(
                  feedback: SizedBox(
                    width: 40,
                    height: 40,
                    child: Material(
                      color: sakit.withOpacity(0.5),
                      shape: StadiumBorder(),
                      elevation: 4,
                    ),
                  ),
                  data: sakit,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Material(
                      color: sakit,
                      shape: StadiumBorder(),
                      elevation: 4,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Sakit",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: greyColor))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Draggable(
                  feedback: SizedBox(
                    width: 40,
                    height: 40,
                    child: Material(
                      color: alpa.withOpacity(0.5),
                      shape: StadiumBorder(),
                      elevation: 4,
                    ),
                  ),
                  data: alpa,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Material(
                      color: alpa,
                      shape: StadiumBorder(),
                      elevation: 4,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Alpa",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: greyColor))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
