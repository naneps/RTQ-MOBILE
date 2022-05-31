// import 'dart:_http';

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:tahfidz/data/dumy+data.dart';
import 'package:tahfidz/model/nilai.dart';
import 'dart:convert';

import 'package:tahfidz/model/pelajaran.dart';
import 'package:http/http.dart' as http;

void main() async {
  try {
    String baseUrl = "http://api.rtq-freelance.my.id/api-v1";
    String token =
        "c48ea743e989a545fd9673bc26f0bddbd0766738deefb9c349bbe56e5725ce227dd1085f56d2ae6b";

    Future<void> updateNilai(
        {String? idNilai, String? idAsatidz, String? nilai}) async {
      var body = {
        'nilai': nilai,
      };
      var json = jsonEncode(body);

      try {
        var url = Uri.parse('$baseUrl/penilaian/put/$idNilai/$idAsatidz');
        var response = await http.put(url,
            headers: {
              HttpHeaders.authorizationHeader: token,
              // "Content-Type": "application/json",
              HttpHeaders.contentTypeHeader: "application/json"
            },
            body: json);

        if (kDebugMode) {
          print("StatusCode update Nilai : ${response.statusCode}");
        }
        if (response.statusCode == 200) {
          if (kDebugMode) {
            print("Update Nilai Berhasil");
          }
        } else {
          print("Update Nilai Gagal");
        }
      } catch (e) {
        print("Catc.h Create Nilai : $e");
      }
    }

    // await updateNilai(idNilai: "2", idAsatidz: "1", nilai: "40");
  } on Exception catch (e) {
    // print(e);
  }
}
