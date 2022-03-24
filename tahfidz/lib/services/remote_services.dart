import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/model/Jenjang.dart';
import 'package:tahfidz/model/asatidz.dart';
import 'package:tahfidz/model/santri.dart';
import 'package:tahfidz/views/pengajar/home/home_screen.dart';

class RemoteServices {
  static var client = http.Client();
  static var baseUrl = "http://rtq-freelance.my.id/api/";

  static Future<void> loginProses(TextEditingController controllerTelepon,
      TextEditingController controllerPassword) async {
    Dio dio = Dio();
    try {
      Response response;

      // ProgressDialog? progressDialog = ProgressDialog(context);
      // progressDialog.style(message: "Harap Tunggu...");
      // progressDialog.show();

      response = await dio.post(
        "http://rtq-freelance.my.id/api/login",
        data: FormData.fromMap(
          {
            "no_hp": "${controllerTelepon.text}",
            "password": "${controllerPassword.text}",
          },
        ),
      );

      // progressDialog.hide();

      if (response.data['status'] == true) {
        SpUtil.putBool("status", response.data['status']);
        SpUtil.putString("nama", response.data['data']['nama']);
        SpUtil.putString("keterangan", response.data['data']['keterangan']);
        SpUtil.putString("no_hp", response.data['data']['no_hp']);
        // setState(() {
        //   controllerTelepon.text = "";
        //   controllerPassword.text = "";
        // });

        Get.off(HomeScreen(telepon: response.data['data']['no_hp']));
      } else if (response.data['status'] == false) {
        // sendLoginFailed();
      }
    } on DioError catch (e) {
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

  Future<Asatid> getUserInfo() async {
    var headers = {
      'rtq_api':
          '7c0252690394028fe49661ca21e448591e01a220a8464f6d30246bbf3122b8b309c56b2802b85e09',
    };

    final response = await http.get(
        Uri.parse('http://api.rtq-freelance.my.id/api-v1/profil/user/detail'),
        headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return new Asatid.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
