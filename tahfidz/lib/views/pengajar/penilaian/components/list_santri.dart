import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';

class ListSantri extends StatelessWidget {
  final String? namaSantri;
  final String? id;
  dynamic onTap;

  ListSantri({this.onTap, this.namaSantri, this.id, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: greyColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: -1,
            child: Container(
              height: 50,
              // width: 30,
              // color: Colors.black,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildBtnPenilaianTadribat(context, id),
                  buildBtnHaflan(context, id)
                  // buildBtnPenilaianTadribat(context, id)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBtnPenilaianTadribat(BuildContext context, index) {
    final size = MediaQuery.of(context).size;
    int count = 1;
    return TextButton(
      onPressed: () {
        Get.defaultDialog(
            content: Container(
              width: size.width,
              height: size.height / 2,
              // color: mainColor,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    trailing: Container(
                      width: 60,
                      height: 40,
                      // color: Colors.white,
                      child: Center(
                        child: Text("80"),
                      ),
                    ), // trailing: TextField(),

                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/nomor.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "${count + index}",
                          style: GoogleFonts.poppins(fontSize: 14),
                        )
                      ],
                    ),
                    title: Text("Pelajaran ${count + index}"),
                  );
                },
              ),
            ),
            title: "Penilaian Tadribat",
            barrierDismissible: false,
            cancel: IconButton(
                onPressed: () => Get.back(), icon: Icon(Icons.close)));
      },
      child: Text(
        "Tadribat",
        style: GoogleFonts.poppins(color: mainColor),
      ),
      // icon: Icon(Icons.abc_outlined),
    );
  }

  Widget buildBtnHaflan(BuildContext context, id) {
    final size = MediaQuery.of(context).size;
    int count = 1;
    return TextButton(
      onPressed: () {
        Get.defaultDialog(
            content: Container(
              width: size.width,
              height: size.height / 2,
              // color: mainColor,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    trailing: Container(
                      width: 60,
                      height: 40,
                      // color: Colors.white,
                      child: Center(
                        child: Text("80"),
                      ),
                    ), // trailing: TextField(),

                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/nomor.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "${count + index}",
                          style: GoogleFonts.poppins(fontSize: 14),
                        )
                      ],
                    ),
                    title: Text("Hafalan ${count + index}"),
                  );
                },
              ),
            ),
            title: "Penilaian Hafalan",
            barrierDismissible: false,
            cancel: IconButton(
                onPressed: () => Get.back(), icon: Icon(Icons.close)));
      },
      child: Text("Hafalan"),
    );
  }
}
