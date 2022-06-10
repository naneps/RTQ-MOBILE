// import 'dart:_http';

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  try {
    String baseUrl = "http://api.rtq-freelance.my.id/api-v1";
    String token =
        "4f1ff4c6320d1b1eaf1fea8b6331cc18229ef5d79c207bd05b9c78d388392306390efdc9331c0174";
    String id = "1";

    // print(await getAbesnToday());
    // await updateNilai(idNilai: "2", idAsatidz: "1", nilai: "40");
    Future rekapPenilaian() async {
      var url = Uri.parse("$baseUrl/penilaian/view/1");
      var response = await http.get(url, headers: {
        "Authorization": token,
        "Content-Type": "application/json"
      });
      if ( response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
      }
        
      }
    
    }

    // await rekapPenilaian();

    // await storeIuran(idSantri: "1", nominal: "1000");
  } on Exception catch (e) {
    // print(e);
  }
}
