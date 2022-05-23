// To parse this JSON data, do
//
//     final pelajaran = pelajaranFromJson(jsonString);

import 'dart:convert';

List<Pelajaran> pelajaranFromJson(String str) =>
    List<Pelajaran>.from(json.decode(str).map((x) => Pelajaran.fromJson(x)));

String pelajaranToJson(List<Pelajaran> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pelajaran {
  Pelajaran({
    this.id,
    this.idJenjang,
    this.idKategori,
    this.pelajaran,
  });

  String? id;
  String? idJenjang;
  String? idKategori;
  String? pelajaran;

  factory Pelajaran.fromJson(Map<String, dynamic> json) => Pelajaran(
        id: json["id"],
        idJenjang: json["id_jenjang"],
        idKategori: json["id_kategori"],
        pelajaran: json["pelajaran"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_jenjang": idJenjang,
        "id_kategori": idKategori,
        "pelajaran": pelajaran,
      };
}
