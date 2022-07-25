// To parse this JSON data, do
//
//     final Absen = AbsenFromJson(jsonString);

import 'dart:convert';

List<Absen> absenFromJson(String str) =>
    List<Absen>.from(json.decode(str).map((x) => Absen.fromJson(x)));

String absenToJson(List<Absen> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Absen {
  Absen({
    this.id,
    this.gambar,
    this.alamat,
    this.tanggalAbsen,
  });

  int? id;
  String? gambar;
  String? alamat;
  DateTime? tanggalAbsen;

  factory Absen.fromJson(Map<String, dynamic> json) => Absen(
        id: json["id"],
        gambar: json["gambar"],
        alamat: json["alamat"],
        tanggalAbsen: DateTime.parse(json["tanggal_absen"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gambar": gambar,
        "alamat": alamat,
        "tanggal_absen": tanggalAbsen!.toIso8601String(),
      };
}
