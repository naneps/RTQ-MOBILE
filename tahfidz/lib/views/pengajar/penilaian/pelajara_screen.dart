import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/model/Jenjang.dart';

class PelajaranScreen extends StatefulWidget {
  // String? id;
  final Jenjang? jenjang;

  PelajaranScreen({this.jenjang, Key? key}) : super(key: key);

  @override
  State<PelajaranScreen> createState() => _PelajaranScreenState();
}

class _PelajaranScreenState extends State<PelajaranScreen> {
  JenjangController jenjangController = Get.put(JenjangController());
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("object");
    print(widget.jenjang);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: mainColor,
        title: Text("${widget.jenjang!.namaKelas}"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: width,
        // child:
        child: Column(
          children: [
            Container(
              width: width,
              height: 200,
              child: ListView.builder(
                  itemCount: widget.jenjang!.pelajaran!.length,
                  itemBuilder: (context, index) {
                    return Text("${widget.jenjang!.pelajaran!.length}");
                  }),
            )
          ],
        ),
      ),
    );
  }
}
