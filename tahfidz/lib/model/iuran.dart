// To parse this JSON data, do
//
//     final Iuran = IuranFromJson(jsonString);

import 'dart:convert';

List<Iuran> iuranFromJson(String str) =>
    List<Iuran>.from(json.decode(str).map((x) => Iuran.fromJson(x)));

String iuranToJson(List<Iuran> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Iuran {
  Iuran({
    this.tglIuran,
    this.uang,
    this.status,
    this.id,
  });

  String? tglIuran;
  String? uang;
  String? status;
  String? id;

  factory Iuran.fromJson(Map<String, dynamic> json) => Iuran(
        tglIuran: json["tgl_iuran"],
        uang: json["uang"],
        status: json["status"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "tgl_iuran": tglIuran,
        "uang": uang,
        "status": status,
        "id": id,
      };
}
