import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
    Dio dio = Dio();
    try {
      // var response;

      // ProgressDialog? progressDalog = ProgressDialog(context);
      // progressDialog.style(message: "Harap Tunggu...");
      // progressDialog.show();

      var response = await http.post(
          Uri.parse("http://api.rtq-freelance.my.id/api-v1/login"),
          body: {
            'no_hp': controllerTelepon.text,
            'password': controllerPassword.text
          });

      if (response.statusCode == 200) {
        var user = userFromJson(response.body);

        if (int.parse(user.idRole!) == 2) {
          // print(response.headers['authorization']);
          Get.off(HomeScreen(
            telepon: user.noHp.toString(),
            token: user.token.toString(),
          ));
          SpUtil.putBool('status', true);
          SpUtil.putString("nama", user.nama.toString());
          SpUtil.putString("keterangan", user.keterangan.toString());
          SpUtil.putString("no_hp", user.noHp.toString());
          SpUtil.putString("token", user.token.toString());
        } else if (user.idRole == 4) {
          print(user.idRole);
        }

        // Get.off(HomeScreen(telepon: response.data['data']['no_hp']));
        print(user.nama);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<Jenjang>?> fetchJenjang() async {
    var resposne = await client.get(Uri.parse(
        "https://623aa9b8b5292b8bfcb807ee.mockapi.io/rtq/api/jenjang"));
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
    // print(response.body);

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
        'http://api.rtq-freelance.my.id/api-v1/api-v1/absensi/pengajar';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    var response = await request.send();
    if (response.statusCode == 201) {
      print(response.statusCode);
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }
}
