import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tahfidz/model/halaqoh.dart';

void main() async {
  try {
    String token =
        "a95c1ac365bcc71a1bb6304edc8dbfc678ea0e165a9cf519abef46cb83b87b6bc7e337c01ba5b3ad";
    String? kodeHalaqoh;
    String? idJenjang;

    String baseUrl = "http://api.rtq-freelance.my.id/api-v1";
    Uri urlHalaqoh = Uri.parse("$baseUrl/cabang/view/all");
    // Uri urlHalaqoh = Uri.parse("$baseUrl/cabang/view/all");
    Uri urlSantri = Uri.parse("$baseUrl/santri/view/$kodeHalaqoh/$idJenjang");
    var resHalaqoh = await http
        .get(urlHalaqoh, headers: {HttpHeaders.authorizationHeader: token});
    var resSantri = await http
        .get(urlHalaqoh, headers: {HttpHeaders.authorizationHeader: token});

    List<Halaqoh> listHalaqoh = halaqohFromJson(resHalaqoh.body);
  } on Exception catch (e) {
    // TODO
    print(e);
  }
}
