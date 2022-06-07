// import 'dart:_http';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/data/dumy+data.dart';
import 'package:tahfidz/model/absen.dart';
import 'package:tahfidz/model/nilai.dart';
import 'dart:convert';

import 'package:tahfidz/model/pelajaran.dart';
import 'package:http/http.dart' as http;
import 'package:tahfidz/model/user.dart';
import 'dart:convert';

void main() async {
  try {
    String baseUrl = "http://api.rtq-freelance.my.id/api-v1";
    String token =
        "93aa3b8bf4d495e941712c7e35d878f91197eb4122071474430d86bbb896a93648e86be44ce9c34e";
    String id = "1";

    // print(await getAbesnToday());
    // await updateNilai(idNilai: "2", idAsatidz: "1", nilai: "40");
    Future<bool?> storeIuran({String? idSantri, String? nominal}) async {
      var url = Uri.parse("$baseUrl/iuran/store");

      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": SpUtil.getString('token')!
        },
        body: json.encode({
          "id_asatidz": SpUtil.getString('id'),
          "id_santri": idSantri,
          "nominal": nominal,
        }),
      );
      print(response.body);
    }

    await storeIuran(idSantri: "1", nominal: "1000");
  } on Exception catch (e) {
    // print(e);
  }
}
