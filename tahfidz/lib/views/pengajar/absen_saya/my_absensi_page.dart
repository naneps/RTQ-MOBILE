import 'dart:io';

// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/pengajar/absen_saya/components/widget_foto.dart';

class MyAbsen extends StatefulWidget {
  const MyAbsen({Key? key}) : super(key: key);

  @override
  State<MyAbsen> createState() => _MyAbsenState();
}

class _MyAbsenState extends State<MyAbsen> {
  File? imageFile;
  final _addFormKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  bool isAbsen = false;

  Map<String, String> body = {'alamat': 'alamat'};

  // static String get s => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            WidgetFoto(
              fileImage: imageFile,
            ),
            SizedBox(height: 30),

            // Flexible(
            //   child: Container(
            //     padding: EdgeInsets.all(10),
            //     margin: EdgeInsets.all(20),
            //     width: MediaQuery.of(context).size.width / 1.2,
            //     child: Text(
            //       'Ok',
            //       style: TextStyle(color: Colors.white, fontSize: 16),
            //     ),
            //     decoration: BoxDecoration(
            //       color: mainColor,
            //       borderRadius: BorderRadius.all(Radius.circular(20)),
            //     ),
            //   ),
            // ),

            // Container(child: MyButton())
          ],
        ),
      ),
    );
  }
}
