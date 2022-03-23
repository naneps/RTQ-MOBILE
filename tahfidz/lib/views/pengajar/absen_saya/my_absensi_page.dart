import 'dart:io';

// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tahfidz/components/constants.dart';

class MyAbsen extends StatefulWidget {
  const MyAbsen({Key? key}) : super(key: key);

  @override
  State<MyAbsen> createState() => _MyAbsenState();
}

class _MyAbsenState extends State<MyAbsen> {
  File? imageFile;

  bool isAbsen = false;
  String? location = "Tekan Tombol";
  String? address = "";

  final picker = ImagePicker();

  Future getImageFromCanera() async {
    var pickImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickImage != null) {
        imageFile = File(pickImage.path);
      } else {
        print("no image  selecter");
      }
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();

      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddress(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    address =
        '${place.subAdministrativeArea} , ${place.locality} , ${place.subLocality} , ${place.postalCode} ';
    setState(() {});
    print(placemarks);
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
                          getImageFromCanera();
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
                          height: 50,
                          width: 50,
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
                  Position position = await _determinePosition();
                  location =
                      'Lat : ${position.latitude} , Long : ${position.longitude}';
                  // print(position.latitude);
                  getAddress(position);
                  setState(() {});
                },
              ),
            ),

            (isAbsen == false)
                ? Container(
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
                        print(imageFile!);
                      },
                    ),
                  )
                : Text("Sudah Absen"),
            // Container(child: MyButton())
          ],
        ),
      ),
    );
  }
}

// Container(
//               margin: EdgeInsets.all(10),
//               width: MediaQuery.of(context).size.width / 1.2,
//               height: MediaQuery.of(context).size.width / 7.5,
//               // color: mainColor,
//               child: TextField(
//                 readOnly: true,
//                 // focusNode: FocusNode(),
//                 scrollPadding: EdgeInsets.all(10),
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     filled: true,
//                     hintStyle: TextStyle(color: Colors.grey[800], fontSize: 16),
//                     hintText: address,
//                     fillColor: Colors.white),
//               ),
//             ),
