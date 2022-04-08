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
  String? location = "Tekan Tombol";
  String? address = "";

  // static String get s => null;

  Future<void> getAddress(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];

    setState(() {
      address =
          '${place.subAdministrativeArea} , ${place.locality} , ${place.subLocality} , ${place.postalCode} ';
    });
    print(placemarks);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RemoteServices();
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

            Flexible(
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 1.2,
                child: Text(
                  address!,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: ElevatedButton(
                child: Container(
                  // color: mainColor,
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 26,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Lokasi",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  primary: mainColor,
                  // onPrimary: mainColor,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: () async {
                  Position position = await RemoteServices.determinePosition();
                  location =
                      'Lat : ${position.latitude} , Long : ${position.longitude}';
                  // print(position.latitude);
                  getAddress(position);
                  setState(() {});
                },
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: ElevatedButton(
                child: Container(
                  // color: mainColor,
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.save_as_sharp,
                        size: 26,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Simpan !",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  primary: greenColor,
                  // onPrimary: mainColor,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  print(imageFile);
                  print(address);
                  // setState(() {});
                  if (_addFormKey.currentState!.validate()) {
                    _addFormKey.currentState!.save();
                    Map<String, String> body = {'alamat': address!};
                    RemoteServices.addImage(body, imageFile!.path);
                  }
                },
              ),
            )

            // Container(child: MyButton())
          ],
        ),
      ),
    );
  }
}
