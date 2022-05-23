import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/model/Jenjang.dart';
import 'package:tahfidz/model/asatidz.dart';
import 'package:tahfidz/model/cabang.dart';
import 'package:tahfidz/model/halaqoh.dart';
import 'package:tahfidz/model/iuran.dart';
import 'package:tahfidz/model/kategori_penilaian.dart';
import 'package:tahfidz/model/pelajaran.dart';
import 'package:tahfidz/model/santri.dart';
import 'package:tahfidz/model/santri_by.dart';
import 'package:tahfidz/model/user.dart';
import 'package:tahfidz/views/asatidz/home/home_screen.dart';

class RemoteServices {
  // static var client = http.Client();
  // static var baseUrl = "http://10.0.112.110:3000/";
  static var baseUrl = "http://api.rtq-freelance.my.id/api-v1";

  static Future<bool?> loginProses(TextEditingController controllerTelepon,
      TextEditingController controllerPassword) async {
    try {
      var response = await http.post(
          Uri.parse("http://api.rtq-freelance.my.id/api-v1/login"),
          // Uri.parse(baseUrl + 'api-v1/login'),
          body: {
            'no_hp': controllerTelepon.text,
            'password': controllerPassword.text
          });

      if (response.statusCode == 200) {
        var user = userFromJson(response.body);

        if (int.parse(user.idRole!) == 3) {
          Get.off(HomeScreen(
            telepon: user.noHp.toString(),
            token: user.token.toString(),
          ));
          SpUtil.putBool('status', true);
          SpUtil.putString("nama", user.nama.toString());
          SpUtil.putString("id", user.id.toString());
          SpUtil.putString("keterangan", user.keterangan.toString());
          SpUtil.putString("no_hp", user.noHp.toString());
          SpUtil.putString("token", user.token.toString());
          SpUtil.putString("id_role", user.idRole.toString());
        } else if (int.parse(user.idRole!) == 4) {
          Get.off(HomeScreen(
            telepon: user.noHp.toString(),
            token: user.token.toString(),
          ));
          SpUtil.putBool('status', true);
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

  static Future<List<Jenjang>?> fetchJenjang(String token) async {
    try {
      var url = Uri.parse('$baseUrl/jenjang/view/all');
      var resposne = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: token});
      print("fetch jenjang code ${resposne.body}");
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        return jenjangFromJson(jsonString);
      } else {
        return null;
      }
    } on Exception catch (e) {
      // TODO
      print("Fetch jenjang :$e");
    }
  }

  static Future<List<Cabang>?> fetchCabang(String token) async {
    try {
      var url = Uri.parse('$baseUrl/cabang/view/all');
      var resposne = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: token});
      print("Status Code Fetch Cabang : ${resposne.statusCode}");
      print("Body Fetch Cabang : ${resposne.body}");
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        return cabangsFromJson(jsonString);
      }
    } catch (e) {
      print("Catch FetchCabang : $e");
    }
    // return cabangsFromJson(jsonString);
  }

  static Future<List<Santri>?> fetchSantri(String token) async {
    try {
      var url = Uri.parse('$baseUrl/santri/view/all');
      var resposne = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: token});
      print("StatusCode Fetch Santri : ${resposne.statusCode}");
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        return santriFromJson(jsonString);
      }
    } catch (e) {
      print("Catch FetchSantri : $e");
    }
  }

  static Future<List<SantriBy>?> filterhSantri(
      String token, String? kdHalaqoh, String? idJenjang) async {
    try {
      var url = Uri.parse('$baseUrl/santri/view/$kdHalaqoh/$idJenjang');
      var resposne = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: token});
      print("StatusCode Filter Santri : ${resposne.statusCode}");
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        print(resposne.body);
        return santriByFromJson(jsonString);
      }
    } catch (e) {
      print("Catch Filter Santri Santri : $e");
    }
  }

  static Future<List<Iuran>?> fetchIuran() async {
    try {
      var url = Uri.parse(
          'https://623aa9b8b5292b8bfcb807ee.mockapi.io/rtq/api/authors');
      var resposne = await http.get(
        url,
      );
      print("StatusCode Fetch Iuran : ${resposne.statusCode}");
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        return iuranFromJson(jsonString);
      }
    } catch (e) {
      print("Catch Fetch Iuran : $e");
    }
  }

  static Future<List<Halaqoh>> fetchHalaqoh(String token, filter) async {
    try {
      var url = Uri.parse('$baseUrl/cabang/view/all');
      var resposne = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: token});
      print("StatusCode Fetch Halaqoh : ${resposne.statusCode}");
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        print("respone body halqoh : $jsonString");
        return halaqohFromJson(jsonString);
      }
      return [];
    } catch (e) {
      print("Catch Fetch Halaqoh : $e");
    }
    return [];
  }

  static Future<Asatidz?> getUserInfo(String token) async {
    try {
      var url = Uri.parse('$baseUrl/profil/user/detail');
      var response = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: token});
      print("StatusCode getUserInfo : ${response.statusCode}");

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return Asatidz.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e) {
      print("Catch GetUserInfo ; $e");
    }
  }

  static Future<bool?> addImage(Map<String, String> body, File filepath) async {
    try {
      DateTime date = DateTime.now();
      File fileRename = filepath.rename("$date") as File;
      String addimageUrl = baseUrl + '/api-v1/absensi/asatidz';
      Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
      };
      var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
        ..fields.addAll(body)
        ..headers.addAll(headers)
        ..files
            .add(await http.MultipartFile.fromPath('image', fileRename.path));
      var response = await request.send();

      // print(response.statusCode);
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

// Lokasi
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();

      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  static Future<List<Pelajaran>?> fetchPelajaran() async {
    try {
      var url = Uri.parse(
          'https://623aa9b8b5292b8bfcb807ee.mockapi.io/rtq/api/pelajaran');
      var resposne = await http.get(url);
      print("StatusCode Fetch Pelajaran : ${resposne.statusCode}");
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        return pelajaranFromJson(jsonString);
      } 
    } catch (e) {
      print("Catch Fetch Pelajaran : $e");
    }
  }

  static Future<List<KategoriPenilaian>> fetchKategoriPenilaian(
      String token) async {
    try {
      var url = Uri.parse(
          'http://api.rtq-freelance.my.id/api-v1/kategori_penilaian/view/all');
      var resposne = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: token});
      print("StatusCode Fetch Kategori Penilaian : ${resposne.statusCode}");
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        return kategoriPenilaianFromJson(jsonString);
      }
    } catch (e) {
      print("Catch Fetch Kategori Penilaian : $e");
    }
    return [];
  }

  static Future<List<SantriBy>?> filterPelajaran(
      String token, String? kdHalaqoh, String? idJenjang) async {
    try {
      var url = Uri.parse('$baseUrl/pelajaran/view/$kdHalaqoh/$idJenjang');
      var resposne = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: token});
      print("StatusCode Filter pelajaran : ${resposne.statusCode}");
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        print(resposne.body);
        return santriByFromJson(jsonString);
      }
    } catch (e) {
      print("Catch Filter Pelajaran : $e");
    }

  }

  //creete function countPersent

}
