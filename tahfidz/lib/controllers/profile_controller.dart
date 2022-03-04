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

  // ProfileController(this.tlp);

  // getUser() async {
  //   final client = RetryClient(http.Client());
  //   try {
  //     var response = await client.get(Uri.parse(
  //         'http://rtq-freelance.my.id/api/info_profil/' + widget.tlp));

  //     if (response.statusCode == 200) {
  //       var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  //       ProfileController.nama.text = jsonResponse['data']['nama'];
  //       ProfileController.alamat.text = jsonResponse['data']['no_hp'];
  //       ProfileController.teleponLama.text = jsonResponse['data']['no_hp'];
  //       ProfileController.alamat.text = jsonResponse['data']['alamat'];
  //       ProfileController.jenisKelamin.text = jsonResponse['data']['alamat'];
  //       ProfileController.alamat.text = jsonResponse['data']['alamat'];
  //       ProfileController.tempatLahir.text = jsonResponse['data']['alamat'];
  //     } else {
  //       dataFailed();
  //     }
  //   } finally {
  //     client.close();
  //   }
  // }
}
