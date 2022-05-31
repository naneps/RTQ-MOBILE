import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/model/user.dart';
import 'package:tahfidz/views/asatidz/home/home_screen.dart';
import 'package:http/http.dart' as http;

class AuthController {
  final TextEditingController teleponeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool?> login({String? telepon, String? password}) async {
    try {
      var response = await http
          .post(Uri.parse("http://api.rtq-freelance.my.id/api-v1/login"),
              // Uri.parse(baseUrl + 'api-v1/login'),
              body: {'no_hp': telepon, 'password': password});
      print(response.statusCode);
      if (response.statusCode == 200) {
        var user = userFromJson(response.body);

        if (int.parse(user.idRole!) == 3) {
          Get.off(HomeScreen());
          SpUtil.putBool('isLogin', true);
          SpUtil.putString("nama", user.nama.toString());
          SpUtil.putString("id", user.id.toString());
          SpUtil.putString("keterangan", user.keterangan.toString());
          SpUtil.putString("no_hp", user.noHp.toString());
          SpUtil.putString("token", user.token.toString());
          SpUtil.putString("id_role", user.idRole.toString());
        } else if (int.parse(user.idRole!) == 4) {
          Get.off(HomeScreen());
          SpUtil.putBool('isLogin', true);
          SpUtil.putString("nama", user.nama.toString());
          SpUtil.putString("keterangan", user.keterangan.toString());
          SpUtil.putString("no_hp", user.noHp.toString());
          SpUtil.putString("token", user.token.toString());
          SpUtil.putString("id_role", user.idRole.toString());
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error Login Proses : $e.');
    }
  }
}
