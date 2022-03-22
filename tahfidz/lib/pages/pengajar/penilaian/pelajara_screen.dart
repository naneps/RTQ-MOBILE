import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/components/constants.dart';

class PelajaranScreen extends StatelessWidget {
  String? id;
  PelajaranScreen({this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: mainColor,
        title: Text("$id"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: width,
                // height: 5,
                color: mainColor,
                // child: Text("helo"),
                child: Row(
                  children: [
                    Container(
                      // width: 35,
                      // height: 50,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text("Material",
                              style: GoogleFonts.poppins(fontSize: 20)),
                          Icon(LineIcons.stripe)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
