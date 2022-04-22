// To parse this JSON data, do
//
//     final cabang = cabangFromJson(jsonString);

import 'dart:convert';

List<Cabang> cabangsFromJson(String str) =>
    List<Cabang>.from(json.decode(str).map((x) => Cabang.fromJson(x)));

String cabangToJson(List<Cabang> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Cabang cabangFromJson(String str) => Cabang.fromJson(json.decode(str));

// String cabangToJson(Cabang data) => json.encode(data.toJson());

class Cabang {
  Cabang({
    this.id,
    this.namaCabang,
  });

  int? id;
  String? namaCabang;

  factory Cabang.fromJson(Map<String, dynamic> json) => Cabang(
        id: json["id"],
        namaCabang: json["nama_cabang"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_cabang": namaCabang,
      };
}
