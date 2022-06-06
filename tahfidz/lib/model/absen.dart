// To parse this JSON data, do
//
//     final abesn = abesnFromJson(jsonString);

import 'dart:convert';

List<Abesn> abesnFromJson(String str) =>
    List<Abesn>.from(json.decode(str).map((x) => Abesn.fromJson(x)));

String abesnToJson(List<Abesn> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Abesn {
  Abesn({
    this.id,
    this.gambar,
    this.alamat,
    this.tanggalAbsen,
  });

  int? id;
  String? gambar;
  String? alamat;
  DateTime? tanggalAbsen;

  factory Abesn.fromJson(Map<String, dynamic> json) => Abesn(
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
