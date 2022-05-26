// import 'dart:_http';

import 'dart:io';

import 'package:tahfidz/data/dumy+data.dart';
import 'package:tahfidz/model/nilai.dart';
import 'dart:convert';

import 'package:tahfidz/model/pelajaran.dart';
import 'package:http/http.dart' as http;

void main() async {
  try {
    String baseUrl = "http://api.rtq-freelance.my.id/api-v1";
    String token =
        "1cc15cb34479c552db57ab4171b4db0e2b3fe97bd6a86632349b546a799508732af83774b35f3794";
    // File file = File("C:\\Users\\msi_r\\Downloads\\IMG20220329083035.jpg");

    // crete function filterNilai By  id_santri , id_pelajaran
    Future<Nilai> filterNilai(String idPelajaran, String idSantri) async {
      Nilai? nilai;
      try {
        var url = Uri.parse('$baseUrl/penilaian/view/$idPelajaran/$idSantri');
        var resposne = await http
            .get(url, headers: {HttpHeaders.authorizationHeader: token});
        print("StatusCode Filter Nilai : ${resposne.body}");

        if (resposne.statusCode == 200) {
          var json = jsonDecode(resposne.body);
          print("json : $json");

          nilai = Nilai.fromJson(json);
        }
      } catch (e) {
        print("Catc.h Filter Nilai : $e");
      }
      return nilai!;
    }

    // print(await filterNilai("1", "1");
  } on Exception catch (e) {
    // ignore: avoid_print
    print(e);
  }
}
