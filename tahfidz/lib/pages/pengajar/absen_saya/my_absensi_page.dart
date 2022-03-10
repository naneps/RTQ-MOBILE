import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/splashScreen.dart';
import 'package:tahfidz/pages/pengajar/absen_saya/camera_screen.dart';

class MyAbsen extends StatefulWidget {
  const MyAbsen({Key? key}) : super(key: key);

  @override
  State<MyAbsen> createState() => _MyAbsenState();
}

class _MyAbsenState extends State<MyAbsen> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          "Absen Asatidz",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: 400,
              height: 400,
              color: mainColor,
              child: (imageFile != null)
                  ? Image.file(imageFile!)
                  : SizedBox(
                      width: 300,
                      height: 300,
                    ),
            ),
            ElevatedButton(
              onPressed: () async {
                imageFile = await Navigator.push<File>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraScreen(),
                  ),
                );
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
              child: SizedBox(
                height: 60,
                width: 60,
                child: Icon(
                  Icons.camera,
                  size: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
