// import 'dart:_http';

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:tahfidz/data/dumy+data.dart';
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
        "a133c37753670a3a5ff33c6bc9c203c2f6858eede5fe5f752ff15856f51c94ddc160035d2b785eb1";
    String id = "1";

    // await getUserInfo(token);
    Future getSantriByWali() async {
      final response = await http.get(
        Uri.parse( 
          "$baseUrl/santri/view/all/wali-santri",
        ),
        headers: {
          "Authorization":
              "62517d07eac3abe4f031f012f510f9feca63993110c4374fb90d39bc414726f5fbad95fc37a758e8",
        },
      );
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        // var data = jsonDecode(json);
        print(json);
      } else {
        print(response.statusCode);
      }
    }

    await getSantriByWali();
    // await updateNilai(idNilai: "2", idAsatidz: "1", nilai: "40");
  } on Exception catch (e) {
    // print(e);
  }
}
