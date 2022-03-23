// To parse this JSON data, do
//
//     final jenjang = jenjangFromJson(jsonString);

import 'dart:convert';

List<Jenjang> jenjangFromJson(String str) =>
    List<Jenjang>.from(json.decode(str).map((x) => Jenjang.fromJson(x)));

String jenjangToJson(List<Jenjang> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Jenjang {
  Jenjang({
    this.namaKelas,
    this.countSantri,
    this.id,
  });

  String? namaKelas;
  int? countSantri;
  String? id;

  factory Jenjang.fromJson(Map<String, dynamic> json) => Jenjang(
        namaKelas: json["nama_kelas"],
        countSantri: json["count_santri"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nama_kelas": namaKelas,
        "count_santri": countSantri,
        "id": id,
      };
}
