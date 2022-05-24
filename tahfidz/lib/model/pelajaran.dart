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
    this.namaPelajaran,
  });

  String? id;
  String? idJenjang;
  String? idKategori;
  String? namaPelajaran;

  factory Pelajaran.fromJson(Map<String, dynamic> json) => Pelajaran(
        id: json["id"].toString(),
        idJenjang: json["id_jenjang"].toString(),
        idKategori: json["id_kategori"].toString(),
        namaPelajaran: json["nama_pelajaran"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_jenjang": idJenjang,
        "id_kategori": idKategori,
        "nama_pelajaran": namaPelajaran,
      };
}
