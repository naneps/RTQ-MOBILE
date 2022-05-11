import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tahfidz/model/halaqoh.dart';
import 'package:tahfidz/services/remote_services.dart';

void main() async {
  String token =
      "a95c1ac365bcc71a1bb6304edc8dbfc678ea0e165a9cf519abef46cb83b87b6bc7e337c01ba5b3ad";

  RemoteServices.fetchHalaqoh(token).then((value) => print(value));
}
