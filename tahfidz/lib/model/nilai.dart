// To parse this JSON data, do
//
//     final nilai = nilaiFromJson(jsonString);

import 'dart:convert';

List<Nilai> nilaiFromJson(String str) =>
    List<Nilai>.from(json.decode(str).map((x) => Nilai.fromJson(x)));

String nilaiToJson(List<Nilai> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Nilai {
  Nilai({
    this.id,
    this.idPelajaran,
    this.idSantri,
    this.idAsatidz,
    this.idKategori,
    this.nilai,
  });

  dynamic id;
  String? idPelajaran;
  String? idKategori;
  String? idSantri;
  String? idAsatidz;
  String? nilai;

  factory Nilai.fromJson(Map<String, dynamic> json) => Nilai(
        id: json["id"],
        idPelajaran: json["id_pelajaran"],
        idSantri: json["id_santri"],
        idAsatidz: json["id_asatidz"],
        idKategori: json['id_kategori_pelajaran'],
        nilai: json["nilai"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_pelajaran": idPelajaran,
        "id_santri": idSantri,
        "id_asatidz": idAsatidz,
        // "id_kategori_pelajaran": idKategori,
        "id_kategori_pelajaran": idKategori,
        "nilai": nilai,
      };
}
