// import 'dart:_http';

import 'dart:io';

import 'package:flutter/foundation.dart';
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

    Future<List<Abesn>?> fetchAbsen() async {
      try {
        var url = Uri.parse('$baseUrl/absensi/asatidz/rekap');
        var response = await http.get(url, headers: {
          "Authorization": token,
          "Content-Type": "application/json",
        });

        // print(response.statusCode);
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);

          List<Abesn> abesn = [];
          for (var i in jsonResponse) {
            abesn.add(Abesn.fromJson(i));
          }
          return abesn;
        } else {
          if (kDebugMode) {
            print("Error");
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
      return null;
    }

    await fetchAbsen();
    // await updateNilai(idNilai: "2", idAsatidz: "1", nilai: "40");
  } on Exception catch (e) {
    // print(e);
  }
}
