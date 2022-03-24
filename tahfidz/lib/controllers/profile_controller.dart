import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;

class ProfileController {
  // final String? tlp;
  static TextEditingController password = new TextEditingController();
  static TextEditingController telepon = TextEditingController();
  static TextEditingController nama = TextEditingController();
  static TextEditingController alamat = TextEditingController();
  static TextEditingController teleponLama = TextEditingController();
  static TextEditingController jenisKelamin = TextEditingController();
  static TextEditingController tanggalLahir = TextEditingController();
  static TextEditingController tempatLahir = TextEditingController();
  // late Widget tlp;
  // ProfileController(this.tlp);

  getProfil(String tlp) async {
    final client = RetryClient(http.Client());
    try {
      var response = await client
          .get(Uri.parse('http://nataysa.com/api-v1/info_profil/' + tlp));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        nama.text = jsonResponse['data']['nama'];
        alamat.text = jsonResponse['data']['no_hp'];
        teleponLama.text = jsonResponse['data']['no_hp'];
        alamat.text = jsonResponse['data']['alamat'];
        jenisKelamin.text = jsonResponse['data']['alamat'];
        alamat.text = jsonResponse['data']['alamat'];
        tempatLahir.text = jsonResponse['data']['alamat'];
        return jsonResponse;
      } else {
        // dataFailed();
        print("error");
      }
    } finally {
      client.close();
    }
  }
}
