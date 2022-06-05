import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/model/user.dart';
import 'package:tahfidz/views/asatidz/home/home_screen.dart';
import 'package:http/http.dart' as http;

class AuthController {
  final TextEditingController teleponeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool?> login({
    int? idRole,
    String? telepon,
    String? password,
  }) async {
    var response = await http
        .post(Uri.parse("http://api.rtq-freelance.my.id/api-v1/login"),
            // .post(Uri.parse("http://192.168.43.108:8000/api-v1/login"),
            // Uri.parse(baseUrl + 'api-v1/login'),
            body: {
          'no_hp': telepon,
          'password': password,
          'id_role': idRole.toString(),
        });
    // print(response.body);

    try {
      if (response.statusCode == 200) {
        var user = userFromJson(response.body);

        if (user.idRole == 3) {
          Get.offAll(HomeScreen());
          SpUtil.putBool('isLogin', true);
          SpUtil.putString("id", user.id.toString());
          SpUtil.putString("nama", user.nama.toString());
          SpUtil.putString("keterangan", user.keterangan.toString());
          SpUtil.putString("no_hp", user.noHp.toString());
          SpUtil.putString("token", user.token.toString());
          SpUtil.putString("id_role", user.idRole.toString());
          SpUtil.putString('jenis_kelamin', user.jenisKelamin.toString());
          SpUtil.putString('tempah_lahir', user.tempatLahir.toString());
          SpUtil.putString('gambar', user.gambar.toString());
          SpUtil.putString('tanggal_lahir', user.tanggalLahir.toString());
          SpUtil.putString('alamat', user.alamat.toString());
          showSuccessLogin(user.keterangan);
        } else if (user.idRole == 4) {
          Get.offAll(HomeScreen());
          SpUtil.putBool('isLogin', true);
          SpUtil.putString("id", user.id.toString());
          SpUtil.putString("nama", user.nama.toString());
          SpUtil.putString("keterangan", user.keterangan.toString());
          SpUtil.putString("no_hp", user.noHp.toString());
          SpUtil.putString("token", user.token.toString());
          SpUtil.putString("id_role", user.idRole.toString());
          SpUtil.putString('jenis_kelamin', user.jenisKelamin.toString());
          SpUtil.putString('tempah_lahir', user.tempatLahir.toString());
          SpUtil.putString('gambar', user.gambar.toString());
          SpUtil.putString('tanggal_lahir', user.tanggalLahir.toString());
          SpUtil.putString('alamat', user.alamat.toString());
          showSuccessLogin(user.keterangan);
        }

        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      // TODO
    }
  }

  Future<bool?> logOut({String? telepon, String? token}) async {
    var response = await http.post(
      Uri.parse(
        "http://api.rtq-freelance.my.id/api-v1/logout/${SpUtil.getString('no_hp')}",
      ),
      headers: {HttpHeaders.authorizationHeader: SpUtil.getString('token')!},
    );
    print(response.body);
    if (response.statusCode == 200) {
      // SpUtil.clear();
      return true;
    } else {
      return false;
    }

    // .post(Uri.parse("http://
  }
}
