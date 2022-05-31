// import 'dart:_http';

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:tahfidz/data/dumy+data.dart';
import 'package:tahfidz/model/nilai.dart';
import 'dart:convert';

import 'package:tahfidz/model/pelajaran.dart';
import 'package:http/http.dart' as http;
import 'package:tahfidz/model/user.dart';

void main() async {
  try {
    String baseUrl = "http://api.rtq-freelance.my.id/api-v1";
    String token =
        "a133c37753670a3a5ff33c6bc9c203c2f6858eede5fe5f752ff15856f51c94ddc160035d2b785eb1";
    String id = "1";
    Future<User?> getUserInfo(String token) async {
      try {
        var url = Uri.parse('$baseUrl/profil/user/detail');
        var response = await http
            .get(url, headers: {HttpHeaders.authorizationHeader: token});
        print("StatusCode getUserInfo :m ${response.statusCode}");

        if (response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);
          print(User.fromJson(jsonResponse).id);
          return User.fromJson(jsonResponse);
        } else {
          throw Exception('Failed to load data!');
        }
      } catch (e) {
        print("Catch GetUserInfo ; $e");
      }
    }

    await getUserInfo(token);
    // await updateNilai(idNilai: "2", idAsatidz: "1", nilai: "40");
  } on Exception catch (e) {
    // print(e);
  }
}
