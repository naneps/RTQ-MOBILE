// To parse this JSON data, do
//
//     final halaqoh = halaqohFromJson(jsonString);

import 'dart:convert';

List<Halaqoh> halaqohFromJson(String str) =>
    List<Halaqoh>.from(json.decode(str).map((x) => Halaqoh.fromJson(x)));

String halaqohToJson(List<Halaqoh> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Halaqoh {
  Halaqoh({
    this.kodeHalaqah,
    this.namaTempat,
    this.namaDaerah,
  });

  String? kodeHalaqah;
  String? namaTempat;
  String? namaDaerah;

  factory Halaqoh.fromJson(Map<String, dynamic> json) => Halaqoh(
        kodeHalaqah: json["kode_halaqah"],
        namaTempat: json["nama_tempat"],
        namaDaerah: json["nama_daerah"],
      );

  Map<String, dynamic> toJson() => {
        "kode_halaqah": kodeHalaqah,
        "nama_tempat": namaTempat,
        "nama_daerah": namaDaerah,
      };
  bool isEqual(Halaqoh model) {
    return kodeHalaqah == model.kodeHalaqah;
  }
}
