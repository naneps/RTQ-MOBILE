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

class WidgetFoto extends StatefulWidget {
  File? fileImage;
  WidgetFoto({required this.fileImage, Key? key}) : super(key: key);

  @override
  State<WidgetFoto> createState() => _WidgetFotoState();
}

class _WidgetFotoState extends State<WidgetFoto> {
  String? address = '';
  Position? position;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      // clipBehavior: Clip.none,
      // color: Colors.grey,
      child: Column(
        children: [
          SizedBox(
            // color: Colors.black,
            width: double.infinity,
            height: 380,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
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
                        position = await RemoteServices.determinePosition();

                        // print(position.latitude);
                        getAddress(position!);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        primary: Colors.white,
                        shape: const CircleBorder(),
                      ),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.camera,
                          size: 40,
                          color: kFontColor,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Alamat: ${address == '' ? '' : '$address'}",
          ),
          ElevatedButton(
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
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Simpan !",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
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
              Map<String, String> body = {
                "id_asatidz": SpUtil.getString('id')!,
                'alamat': address!,
                // 'foto': widget.fileImage!.path,
              };
              if (widget.fileImage == null || position == null) {
                Get.snackbar("Peringatan", "Foto Terlebih Dahulu",
                    backgroundColor: const Color.fromARGB(255, 255, 204, 0),
                    colorText: Colors.white,
                    icon: const Icon(
                      Icons.error,
                      color: Colors.white,
                    ));
              } else {
                await RemoteServices.createAbsen(body, widget.fileImage!)
                    .then((value) {
                  if (value!) {
                    Get.snackbar(
                      'Berhasil',
                      'Absen berhasil disimpan',
                      icon: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      backgroundColor: greenColor,
                      colorText: Colors.white,
                      borderRadius: 10,
                      snackPosition: SnackPosition.TOP,
                      margin: const EdgeInsets.all(10),
                      duration: const Duration(seconds: 2),
                    );
                    setState(() {});
                    Navigator.pop(context);
                  } else {
                    Get.snackbar('Gagal', 'Absen gagal',
                        backgroundColor: redColor,
                        colorText: Colors.white,
                        icon: const Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ));
                  }
                });
              }

              // print(dataAbensi);
            },
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

  Future<String> getAddress(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];

    setState(() {
      address =
          '${place.subAdministrativeArea} , ${place.locality} , ${place.subLocality} ';
    });

    print(placemarks);
    return address!;
  }
}
