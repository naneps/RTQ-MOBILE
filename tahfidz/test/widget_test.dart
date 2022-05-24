// import 'dart:_http';

import 'dart:io';

import 'package:tahfidz/data/dumy+data.dart';
import 'package:tahfidz/model/nilai.dart';
import 'dart:convert';

import 'package:tahfidz/model/pelajaran.dart';
import 'package:http/http.dart' as http;

void main() async {
  try {
// Create fucntion filterpelajaran fr om api
    String baseUrl = "http://api.rtq-freelance.my.id/api-v1";
    String token =
        "34b2260ed8c642594de369a045b705ffb174dd07a0c809d1df28525fb9a45c87c2c0cc8edd1bb765";

    // print(await filterPelajaran(token, "1", "1"));
  } on Exception catch (e) {
    // TODO
    print(e);
  }

  //setNilai where id nilai
}
