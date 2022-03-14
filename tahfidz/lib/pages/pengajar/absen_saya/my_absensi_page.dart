import 'dart:io';

import 'package:camera/camera.dart';
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
              height: MediaQuery.of(context).size.height / 1.94,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              clipBehavior: Clip.none,
              // color: Colors.grey,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      width: 350,
                      height: 350,
                      child: (imageFile != null)
                          ? Image.file(imageFile!)
                          : SizedBox(
                              width: 300,
                              height: 300,
                              child: Material(
                                child: Image.asset('assets/images/guided.jpg',
                                    fit: BoxFit.cover),
                              ),
                            ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: ElevatedButton(
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
                          elevation: 5,
                          primary: Colors.white,
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
                            color: mainColor,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.width / 7.5,
              // color: mainColor,
              child: TextField(
                readOnly: true,
                // focusNode: FocusNode(),
                scrollPadding: EdgeInsets.all(10),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800], fontSize: 16),
                    hintText: 'JL.Lohbener lama No 14',
                    fillColor: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
