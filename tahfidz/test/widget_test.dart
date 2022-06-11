// import 'dart:_http';

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  try {
    String baseUrl = "http://api.rtq-freelance.my.id/api-v1";
    String token =
        "d7d5a5e67d8327d23ecc5d1039ce645c2dc66d6464084721a7b643ef8ccbf04377795dca3cea135e";
    String id = "1";

    // print(await getAbesnToday());
    // await updateNilai(idNilai: "2", idAsatidz: "1", nilai: "40");
    Future rekapIuranSantri(String id) async {
      var url = Uri.parse("$baseUrl/iuran/detail/$id");
      var response = await http.get(url, headers: {
        "Authorization": token,
        "Content-Type": "application/json"
      });
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
      }
    }

    await rekapIuranSantri("1");
  } on Exception catch (e) {
    print(e);
  }
}

    // await rekapPenilaian();

 

