import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:http/http.dart' as http;
import 'package:tahfidz/views/pengajar/home/home_screen.dart';

class WidgetFoto extends StatefulWidget {
  File? fileImage;
  WidgetFoto({required this.fileImage, Key? key}) : super(key: key);

  @override
  State<WidgetFoto> createState() => _WidgetFotoState();
}

class _WidgetFotoState extends State<WidgetFoto> {
  String? location = "Tekan Tombol";
  String? address = "alamat";
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    var mainColor;
    return Container(
      // height: MediaQuery.of(context).size.height / 2.5,
      height: 600,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      // clipBehavior: Clip.none,
      // color: Colors.grey,
      child: Column(
        children: [
          Container(
            // color: Colors.black,
            width: double.infinity,
            height: 380,
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
                    child: (widget.fileImage != null)
                        ? Image.file(widget.fileImage!)
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
                        Position position =
                            await RemoteServices.determinePosition();
                        location =
                            'Lat : ${position.latitude} , Long : ${position.longitude}';
                        // print(position.latitude);
                        getAddress(position);
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
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 1.2,
            child: Text(
              '$address' + SpUtil.getString('id')!,
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
            ),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
              onPressed: () async {
                Map<String, String> data = {
                  'alamat': address!,
                  'id_asatidz': SpUtil.getString('id')!,
                  'nama': SpUtil.getString('nama')!
                };

                RemoteServices.addImage(data, widget.fileImage!).then((value) {
                  if (value!) {
                    Get.off(HomeScreen(
                        telepon: SpUtil.getString('no_hp')!,
                        token: SpUtil.getString('token')!));
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Future getImageFromCanera() async {
    var pickImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickImage != null) {
        setState(() {
          widget.fileImage = File(pickImage.path);
        });
      } else {
        print("no image  selecter");
      }
    });
  }

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
}
