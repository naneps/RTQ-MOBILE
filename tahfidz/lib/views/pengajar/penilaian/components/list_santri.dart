import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/model/santri.dart';
import 'package:tahfidz/views/pengajar/absensi/absensi_screen.dart';

class ListSantri extends StatelessWidget {
  final String? namaSantri;
  dynamic onTap;

  ListSantri({this.onTap, this.namaSantri, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(2, 2),
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 1)
              ]),
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
                  child: CircleAvatar(
                      // backgroundImage: NetworkImage("${santri!.avatar}"),
                      )),
              SizedBox(width: 20),
              Expanded(
                flex: 4,
                child: Container(
                  // width: 400,
                  margin: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "$namaSantri",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: greyColor),
                        ),
                      ),
                      // Text(
                      //   // "${santri!.jenjang}",
                      //   style: GoogleFonts.poppins(
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.w500,
                      //       color: greyColor),
                      // )
                    ],
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 30,
              ),
            ],
          )
          // child: ,
          ),
    );
  }
}
