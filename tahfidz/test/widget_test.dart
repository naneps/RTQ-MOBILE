// import 'dart:_http';

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/data/helper.dart';
import 'package:tahfidz/model/santri_by.dart';
import 'package:tahfidz/services/remote_services.dart';

void main() async {
  try {
    String baseUrl = "http://api.rtq-freelance.my.id/api-v1";
    String token =
        "70985cb0c3eae7bb0d04ee33cc8d1aa29cc2dd8e1daf1836e17b6416b1a27cbf6c4b2b6d43b4068f";
    // String id = "1";

    Future cekAbsensiSantri({String? idJenjang, String? kdHalaqoh}) async {
      var url = Uri.parse('$baseUrl/absensi/santri/$idJenjang/$kdHalaqoh');
      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: SpUtil.getString('token')!
      });

      if (response.statusCode == 200) {
        return 'true';
      }
    }

    print(await getAbsenTodaySantri("2"));
    // await getTotalSantri(token: token, idJenjang: "1", kdHalaqoh: "HLQSRJ001");
  } on Exception catch (e) {
    print(e);
  }
}


    // await rekapPenilaian();

 

