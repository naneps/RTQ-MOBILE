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
        "34b2260ed8c642594de369a045b705ffb174dd07a0c809d1df28525fb9a45c87c2c0cc8edd1bb765";
    File file = File("C:\\Users\\msi_r\\Downloads\\IMG20220329083035.jpg");

    Future<bool?> addImage(Map<String, String> body, File filepath) async {
      try {
        String addimageUrl = '$baseUrl/absensi/asatidz';
        Map<String, String> headers = {
          'Content-Type': 'multipart/form-data',
        };
        var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
          ..fields.addAll(body)
          ..headers.addAll(headers)
          ..files.add(await http.MultipartFile.fromPath('image', file.path));
        var response = await request.send();

        print(response.statusCode);
        if (response.statusCode == 201) {
          return true;
        } else {
          return false;
        }
      } catch (e) {
        print("Add image $e");
      }
      // return null;
    }

    await addImage({"alamat": "Lohebener"}, file);
  } on Exception catch (e) {
    // ignore: avoid_print
    print(e);
  }
}
