import 'package:http/http.dart' as http;
import 'package:tahfidz/data/dumy+data.dart';
import 'package:tahfidz/model/pelajaran.dart';
import 'dart:convert';

void main() async {
  try {
    List<Pelajaran> filterPelajaran(String idJenjang, String idkategori) {
      List<Pelajaran> pelajaran = [];
      for (var i = 0; i < dataPelajaran.length; i++) {
        if (dataPelajaran[i]['id_jenjang'] == idJenjang &&
            dataPelajaran[i]['id_kategori'] == idkategori) {
          var json = jsonEncode(dataPelajaran[i]);
          var hasilFiletr = jsonDecode(json);
          pelajaran.add(Pelajaran.fromJson(hasilFiletr));
          // print(" json :$json");
          // print(" hasil filter :$hasilFiletr");
          // print(pelajaran[i].pelajaran);
        } else if (dataPelajaran[i]['id_jenjang'] != idJenjang ||
            dataPelajaran[i]['id_kategori'] != idkategori) {
          print("Data Tidak Ada");
        }
      }
      // print(pelajaran[0].pelajaran);

      return pelajaran;
    }

    filterPelajaran("1", "1").forEach((element) {
      print(element.pelajaran);
    });
  } on Exception catch (e) {
    // TODO
    print(e);
  }
}
