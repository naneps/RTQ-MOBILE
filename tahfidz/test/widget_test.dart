import 'package:tahfidz/data/dumy+data.dart';
import 'package:tahfidz/model/nilai.dart';
import 'dart:convert';

void main() async {
  try {
    List<Nilai> filterNilai({String? idPelajaran, String? nis}) {
      List<Nilai> pelajaran = [];
      for (var i = 0; i < dataNilai.length; i++) {
        if (dataNilai[i]['id_pelajaran'] == idPelajaran &&
            dataNilai[i]['nis_santri'] == nis) {
          var json = jsonEncode(dataNilai[i]);
          var hasilFiletr = jsonDecode(json);
          pelajaran.add(Nilai.fromJson(hasilFiletr));
          // print(" json :$json");
          // print(" hasil filter :$hasilFiletr");
          // print(pelajaran[i].pelajaran);
        } else if (dataNilai[i]['id_pelajaran'] != idPelajaran ||
            dataNilai[i]['nis_santri'] != nis) {
          print("Data Tidak Ada");
        }
      }
      // print(pelajaran[0].pelajaran);

      return pelajaran;
    }

    setNilai(String idNilai, int nilai) {
      for (var i = 0; i < dataNilai.length; i++) {
        if (dataNilai[i]['id'] == idNilai) {
          dataNilai[i]['nilai'] = nilai;
        }
      }
    }

    filterNilai(idPelajaran: "2", nis: "29092002").forEach((element) {
      print(element.id);
      print(element.nilai);
      print(element.nisSantri);
      print(element.idPelajaran);
    });

    setNilai("2", 60);

    filterNilai(idPelajaran: "2", nis: "29092002").forEach((element) {
      print(element.id);
      print(element.nilai);
      print(element.nisSantri);
      print(element.idPelajaran);
    });
    // print(dataNilai[1]['nilai']);
  } on Exception catch (e) {
    // TODO
    print(e);
  }

  //setNilai where id nilai
}
