import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/model/santri.dart';
import 'package:tahfidz/views/pengajar/absensi/absensi_screen.dart';

class ListSantri extends StatelessWidget {
  final String? namaSantri;
  final String? id;
  dynamic onTap;

  ListSantri({this.onTap, this.namaSantri, this.id, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      height: 80,
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
          Expanded(
            flex: -2,
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: CircleAvatar(
                    // backgroundImage: NetworkImage("${santri!.avatar}"),
                    )),
          ),
          SizedBox(width: 15),
          Expanded(
            flex: 2,
            child: Container(
              // color: mainColor,
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
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: greyColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              // width: 30,
              // color: Colors.black,
              child: buildBtnPenilaian(context, id),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBtnPenilaian(BuildContext context, index) {
    return IconButton(
        onPressed: () {
          print(index);
        },
        icon: Icon(Icons.abc_outlined));
  }
}
