import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/data/dumy+data.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/asatidz/home/home_screen.dart';

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
    return Container(
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
                        ? Image.file(
                            widget.fileImage!,
                            fit: BoxFit.cover,
                          )
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
                        shape: const RoundedRectangleBorder(
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
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 1.2,
            child: Text(
              '$address',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: ElevatedButton(
              child: SizedBox(
                // color: mainColor,
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
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
                padding: const EdgeInsets.all(10),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              onPressed: () async {
                // Map<String, String> data = {
                //   'alamat': address!,
                //   'id_asatidz': SpUtil.getString('id')!,
                //   'nama': SpUtil.getString('nama')!
                // };

                // await RemoteServices.addImage(data, widget.fileImage!)
                //     .then((value) {
                //   print(value);
                //   if (value!) {
                //     Get.off(
                //       HomeScreen(),
                //     );
                //   }
                // });
                await sendAbsen(
                  DateTime.now(),
                  widget.fileImage!,
                  address!,
                );
                checkAbsenToday();

                setState(() {});
                Navigator.pop(context);
                print(dataAbensi);
              },
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> checkAbsenToday() async {
    var date = DateTime.now().day.toString() +
        '-' +
        DateTime.now().month.toString() +
        '-' +
        DateTime.now().year.toString();
    print(date);
    for (var i = 0; i < dataAbensi.length; i++) {
      if (dataAbensi[i]['tanggal'] == date) {
        print('hari ini sudah absen');
        return await isAbsen();
      } else {
        print(dataAbensi[i]['tanggal']);
        print("hari Ini Belum Absen");
        return await isNotAbsen();
      }
    }
  }

  Future getImageFromCanera() async {
    var pickImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 60);
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
          '${place.subAdministrativeArea} , ${place.locality} , ${place.subLocality} ';
    });
    print(placemarks);
  }
}
