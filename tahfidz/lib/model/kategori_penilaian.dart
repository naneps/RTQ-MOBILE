// To parse this JSON data, do
//
//     final kategoriPenilaian = kategoriPenilaianFromJson(jsonString);

import 'dart:convert';

List<KategoriPenilaian> kategoriPenilaianFromJson(String str) =>
    List<KategoriPenilaian>.from(
        json.decode(str).map((x) => KategoriPenilaian.fromJson(x)));

String kategoriPenilaianToJson(List<KategoriPenilaian> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KategoriPenilaian {
  KategoriPenilaian({
    this.id,
    this.kategoriPenilaian,
  });

  int? id;
  String? kategoriPenilaian;

  factory KategoriPenilaian.fromJson(Map<String, dynamic> json) =>
      KategoriPenilaian(
        id: json["id"],
        kategoriPenilaian: json["kategori_penilaian"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategori_penilaian": kategoriPenilaian,
      };
}
