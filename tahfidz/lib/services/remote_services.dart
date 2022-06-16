import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/model/Jenjang.dart';
import 'package:tahfidz/model/absen.dart';
import 'package:tahfidz/model/cabang.dart';
import 'package:tahfidz/model/halaqoh.dart';
import 'package:tahfidz/model/kategori_penilaian.dart';
import 'package:tahfidz/model/nilai.dart';
import 'package:tahfidz/model/pelajaran.dart';
import 'package:tahfidz/model/santri.dart';
import 'package:tahfidz/model/santri_by.dart';

class RemoteServices {
  static var baseUrl = "http://api.rtq-freelance.my.id/api-v1";

  static Future<List<Jenjang>> fetchJenjang(filter) async {
    try {
      var url = Uri.parse('$baseUrl/jenjang/view/all');
      var resposne = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: SpUtil.getString('token')!
      });
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        return jenjangFromJson(jsonString);
      } else {
        return [];
      }
    } on Exception catch (e) {
      // TODO
      print("Fetch jenjang :$e");
      return [];
    }
    // return null;
  }

  static Future<List<Cabang>?> fetchCabang(String token) async {
    try {
      var url = Uri.parse('$baseUrl/cabang/view/all');
      var resposne = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: token});
      if (kDebugMode) {
        print("Status Code Fetch Cabang : ${resposne.statusCode}");
      }
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        return cabangsFromJson(jsonString);
      }
    } catch (e) {
      print("Catch FetchCabang : $e");
    }
    return null;
    // return null;
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
    return null;
  }

  static Future<List<SantriBy>?> filterSantri(
      {String? kdHalaqoh, String? idJenjang}) async {
    try {
      var url = Uri.parse('$baseUrl/santri/view/$kdHalaqoh/$idJenjang');
      var resposne = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: SpUtil.getString('token')!
      });
      print("StatusCode Filter Santri : ${resposne.statusCode}");
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        // print(resposne.body);
        // print(santriByFromJson(jsonString).first.namaLengkap);
        return santriByFromJson(jsonString);
      }
    } catch (e) {
      print("Catch Filter Santri Santri : $e");
    }
    return null;
  }

  static Future<List<Halaqoh>> fetchHalaqoh(String token, filter) async {
    try {
      var url = Uri.parse('$baseUrl/cabang/view/all');
      var resposne = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: token});
      print("StatusCode Fetch Halaqoh : ${resposne.statusCode}");
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        return halaqohFromJson(jsonString);
      }
      // return [];
    } catch (e) {
      print("Catch Fetch Halaqoh : $e");
    }
    return [];
  }

  static Future getUserInfo(String token) async {
    try {
      var url = Uri.parse('$baseUrl/profil/user/detail');
      var response = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: token});
      print("StatusCode getUserInfo :m ${response.statusCode}");

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        // print(User.fromJson(jsonResponse));
        var data = json.encode(jsonResponse);
        print(data);
        return jsonResponse;
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e) {
      print("Catch GetUserInfo ; $e");
    }
  }

  static Future<bool?> createAbsen(
      Map<String, String> body, File filepath) async {
    try {
      // bool isLoading = true;
      String url = '$baseUrl/absensi/asatidz';
      Map<String, String> headers = {
        HttpHeaders.authorizationHeader: SpUtil.getString("token")!,
        // "Authorization": SpUtil.getString('token')!,
        'Content-Type': 'multipart/form-data',
      };
      // print("body ")
      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..fields.addAll(body)
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('gambar', filepath.path));
      var response = await request.send();
      print(response.stream); // print(request.files.);
      print("stausCode CreateAbsen : ${response.statusCode}");
      // print(response.request.persistentConnection);
      // print(response.request);
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print("Catch Add image $e");
    }
    return null;
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

  static Future<List<KategoriPenilaian>> fetchKategoriPenilaian() async {
    try {
      var url = Uri.parse(
          'http://api.rtq-freelance.my.id/api-v1/kategori/pelajaran/view/all');
      var resposne = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: SpUtil.getString('token')!
      });
      print("StatusCode Fetch Kategori Penilaian : ${resposne.statusCode}");
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        return kategoriPenilaianFromJson(jsonString);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Catch Fetch Kategori Penilaian : $e");
      }
    }
    return [];
  }

  static Future<List<Pelajaran>?> filterPelajaran(
      {String? idJenjang, String? idKategoriPenilaian}) async {
    try {
      var url =
          Uri.parse('$baseUrl/pelajaran/view/$idKategoriPenilaian/$idJenjang');
      var resposne = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: SpUtil.getString('token')!
      });
      print("StatusCode Filter Pelajaran : ${resposne.statusCode}");
      if (resposne.statusCode == 200) {
        var jsonString = resposne.body;
        // print(jsonString);
        return pelajaranFromJson(jsonString);
      }
    } catch (e) {
      print("Catc.h Filter Pelajaran : $e");
    }
    return null;
  }

  static Future<Nilai> filterNilai(
      {String? token, String? idPelajaran, String? idSantri}) async {
    Nilai? nilai;
    try {
      var url = Uri.parse('$baseUrl/penilaian/view/$idPelajaran/$idSantri');
      var resposne = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: token!});
      print("StatusCode Filter Nilai : ${resposne.body}");

      if (resposne.statusCode == 200) {
        var json = jsonDecode(resposne.body);
        print("json : $json");

        nilai = Nilai.fromJson(json);
      }
    } catch (e) {
      print("Catc.h Filter Nilai : $e");
    }
    return nilai!;
  }

  static Future<void> createNilai(
      {String? token,
      String? idSantri,
      String? idPelajaran,
      String? idAsatidz,
      String? idKategori,
      String? nilai}) async {
    var body = {
      'nilai': nilai,
    };
    var json = jsonEncode(body);

    try {
      var url = Uri.parse(
          '$baseUrl/penilaian/store/$idPelajaran/$idSantri/$idKategori/$idAsatidz');
      var response = await http.post(url,
          headers: {
            HttpHeaders.authorizationHeader: token!,
            // "Content-Type": "application/json",
            HttpHeaders.contentTypeHeader: "application/json"
          },
          body: json);

      print("StatusCode Create Nilai : ${response.body}");
    } catch (e) {
      print("Catc.h Create Nilai : $e");
    }
  }

  static Future<bool?> updateNilai(
      {String? token,
      String? idNilai,
      String? idAsatidz,
      dynamic nilai}) async {
    try {
      var body = {
        'nilai': nilai,
      };
      var json = jsonEncode(body);
      var url = Uri.parse('$baseUrl/penilaian/put/$idNilai/$idAsatidz');
      var response = await http.put(url,
          headers: {
            HttpHeaders.authorizationHeader: token!,
            // "Content-Type": "application/json",
            HttpHeaders.contentTypeHeader: "application/json"
          },
          body: json);

      print("StatusCode update Nilai : ${response.statusCode}");
      if (response.statusCode == 200) {
        print("Update Nilai Berhasil");
        return true;
      } else {
        print("Update Nilai Gagal");
        return false;
      }
    } catch (e) {
      print("Catc.h Create Nilai : $e");
    }
    return null;
  }

  static Future getSantriByWali() async {
    final response = await http.get(
      Uri.parse(
        "$baseUrl/santri/view/all/wali-santri",
      ),
      headers: {
        "Authorization": SpUtil.getString('token')!,
      },
    );
    print('StatusCode Santri By Wali : ${response.body}');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      // var data = jsonDecode(json);re\

      print(json);
      return json;
    } else {
      print(response.statusCode);
    }
  }

  static Future<List<Absen>?> fetchRekapAbsen() async {
    try {
      var url = Uri.parse('$baseUrl/absensi/asatidz/rekap');
      var response = await http.get(url, headers: {
        "Authorization": SpUtil.getString('token')!,
        "Content-Type": "application/json",
      });

      // print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        List<Absen> abesn = [];
        for (var i in jsonResponse) {
          abesn.add(Absen.fromJson(i));
        }
        print(abesn);
        return abesn;
      } else {
        if (kDebugMode) {
          print("Error");
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<Absen?> getAbesnToday() async {
    try {
      var url = Uri.parse('$baseUrl/absensi/asatidz');
      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: SpUtil.getString('token')!,
        HttpHeaders.contentTypeHeader: "application/json"
      });
      print("Absen Today " + response.statusCode.toString());
      print(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(response.body);
        return Absen.fromJson(data);
      } else {
        print("Error");
      }
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        if (kDebugMode) {
          print("No Internet Connection");
        }
      } else {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    return null;
  }

  static Future<bool?> storeIuran({String? idSantri, String? nominal}) async {
    print("Store Iuran");
    var url = Uri.parse("$baseUrl/iuran/store");
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": SpUtil.getString('token')!
      },
      body: json.encode({
        "id_asatidz": SpUtil.getString('id'),
        "id_santri": idSantri,
        "nominal": nominal,
      }),
    );
    print("StatusCode Store Iuran : ${response.statusCode}");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future getIuranSantri({String? idSantri}) async {
    var url = Uri.parse("$baseUrl/iuran/detail/$idSantri");
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: SpUtil.getString('token')!,
      },
    );
    print("StatusCode Get Iuran : ${response.statusCode}");
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));

      return jsonDecode(response.body);
      // print(response.body);
      // return Iuran.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  static Future getNominalIuran(String? idIuran) async {
    var url = Uri.parse("$baseUrl/iuran/cek/nominal/$idIuran");
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: SpUtil.getString('token')!,
      },
    );
    print("StatusCode Get nominal Iuran : ${response.statusCode}");
    print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
      // print(response.body);
      // return Iuran.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  static Future rekapPenilaian() async {
    var url = Uri.parse("$baseUrl/penilaian/view/1");
    var response = await http.get(url, headers: {
      "Authorization": SpUtil.getString('token')!,
      "Content-Type": "application/json"
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    }
  }

  static Future rekapIuranSantri(String id) async {
    var url = Uri.parse("$baseUrl/iuran/detail/$id");
    var response = await http.get(
      url,
      headers: {
        "Authorization": SpUtil.getString('token')!,
        "Content-Type": "application/json"
      },
    );
    ;
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    }
  }
}
