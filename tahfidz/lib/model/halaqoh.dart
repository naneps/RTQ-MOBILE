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
    this.namaHalaqah,
    this.lokasiRt,
  });

  String? kodeHalaqah;
  String? namaHalaqah;
  String? lokasiRt;

  factory Halaqoh.fromJson(Map<String, dynamic> json) => Halaqoh(
        kodeHalaqah: json["kode_halaqah"],
        namaHalaqah: json["nama_halaqah"],
        lokasiRt: json["lokasi_rt"],
      );

  Map<String, dynamic> toJson() => {
        "kode_halaqah": kodeHalaqah,
        "nama_halaqah": namaHalaqah,
        "lokasi_rt": lokasiRt,
      };
}
