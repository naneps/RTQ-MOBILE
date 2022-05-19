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
    this.namaPelajaran,
    this.id,
  });

  String? namaPelajaran;
  String? id;

  factory Pelajaran.fromJson(Map<String, dynamic> json) => Pelajaran(
        namaPelajaran: json["nama_pelajaran"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nama_pelajaran": namaPelajaran,
        "id": id,
      };
}
