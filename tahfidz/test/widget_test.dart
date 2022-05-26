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
        "1ae2c666d5f81adfb376594d8e2366dc282c9c5c4b7996804d179415a2d6ed50405fb2987856ab80";

    Future<void> createNilai(
        {String? idSantri,
        String? idPelajaran,
        String? idAsatidz,
        String? idKategori,
        String? nilai}) async {
      var body = {
        // 'id_asatidz': idAsatidz,
        // 'id_santri': idSantri,
        // 'id_kategori_pelajaran': idKategori,
        // 'id_pelajaran': idPelajaran,
        'nilai': nilai,
        // 'nilai' => $request->nilai,
      };
      var json = jsonEncode(body);

      try {
        var url = Uri.parse(
            '$baseUrl/penilaian/store/$idPelajaran/$idSantri/$idKategori/$idAsatidz');
        var response = await http.post(url,
            headers: {
              HttpHeaders.authorizationHeader: token,
              // "Content-Type": "application/json",
              HttpHeaders.contentTypeHeader: "application/json"
            },
            body: json);

        print("StatusCode Create Nilai : ${response.body}");
      } catch (e) {
        print("Catc.h Create Nilai : $e");
      }
    }

    await createNilai(
        idAsatidz: '1',
        idKategori: '1',
        idPelajaran: '2',
        idSantri: '1',
        nilai: '100');
  } on Exception catch (e) {
    print(e);
  }
}
