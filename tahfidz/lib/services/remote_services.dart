import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/model/Jenjang.dart';
import 'package:tahfidz/model/asatidz.dart';
import 'package:tahfidz/model/santri.dart';
import 'package:tahfidz/model/user.dart';
import 'package:tahfidz/views/pengajar/home/home_screen.dart';

class RemoteServices {
  static var client = http.Client();
  static var baseUrl = "http://rtq-freelance.my.id/api/";

  static Future<void> loginProses(TextEditingController controllerTelepon,
      TextEditingController controllerPassword) async {
    try {
      var response = await http.post(
          Uri.parse("http://api.rtq-freelance.my.id/api-v1/login"),
          body: {
            'no_hp': controllerTelepon.text,
            'password': controllerPassword.text
          });

      if (response.statusCode == 200) {
        var user = userFromJson(response.body);
        if (int.parse(user.idRole!) == 3) {
          Get.off(HomeScreen(
            telepon: user.noHp.toString(),
            token: user.token.toString(),
          ));
          SpUtil.putBool('status', true);
          SpUtil.putString("nama", user.nama.toString());
          SpUtil.putString("keterangan", user.keterangan.toString());
          SpUtil.putString("no_hp", user.noHp.toString());
          SpUtil.putString("token", user.token.toString());
        } else if (int.parse(user.idRole!) == 4) {
          Get.off(HomeScreen(
            telepon: user.noHp.toString(),
            token: user.token.toString(),
          ));
          SpUtil.putBool('status', true);
          SpUtil.putString("nama", user.nama.toString());
          SpUtil.putString("keterangan", user.keterangan.toString());
          SpUtil.putString("no_hp", user.noHp.toString());
          SpUtil.putString("token", user.token.toString());
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<Jenjang>?> fetchJenjang() async {
    var resposne = await client.get(Uri.parse(
        "https://623aa9b8b5292b8bfcb807ee.mockapi.io/rtq/api/jenjang"));
    print(resposne.statusCode);
    if (resposne.statusCode == 200) {
      var jsonString = resposne.body;
      return jenjangFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<Santri>?> fetchSantri() async {
    var resposne = await client.get(Uri.parse(
        "https://623aa9b8b5292b8bfcb807ee.mockapi.io/rtq/api/santri"));
    if (resposne.statusCode == 200) {
      var jsonString = resposne.body;
      return santriFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<Asatidz> getUserInfo(String token) async {
    final response = await http.get(
        Uri.parse('http://api.rtq-freelance.my.id/api-v1/profil/user/detail'),
        headers: {HttpHeaders.authorizationHeader: token});
    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return Asatidz.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<bool> addImage(
      Map<String, String> body, String filepath) async {
    String addimageUrl =
        'http://api.rtq-freelance.my.id/api-v1/absensi/pengajar';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    var response = await request.send();

    print(' stats code : ${response.statusCode}');
    return true;
  }

// Lokasi
  static Future<Position> determinePosition() async {
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
}
