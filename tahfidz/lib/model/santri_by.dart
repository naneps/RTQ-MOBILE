// To parse this JSON data, do
//
//     final santriBy = santriByFromJson(jsonString);

import 'dart:convert';

List<SantriBy> santriByFromJson(String str) =>
    List<SantriBy>.from(json.decode(str).map((x) => SantriBy.fromJson(x)));

String santriByToJson(List<SantriBy> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SantriBy {
  SantriBy({
    this.nis,
    this.namaLengkap,
    this.namaHalaqah,
    this.jenjang,
    this.alamat,
    this.foto,
  });

  String? nis;
  String? namaLengkap;
  String? namaHalaqah;
  String? jenjang;
  String? alamat;
  String? foto;

  factory SantriBy.fromJson(Map<String, dynamic> json) => SantriBy(
        nis: json["nis"],
        namaLengkap: json["nama_lengkap"],
        namaHalaqah: json["nama_halaqah"],
        jenjang: json["jenjang"],
        alamat: json["alamat"],
        foto: json["foto"] == null ? null : json["foto"],
      );

  Map<String, dynamic> toJson() => {
        "nis": nis,
        "nama_lengkap": namaLengkap,
        "nama_halaqah": namaHalaqah,
        "jenjang": jenjang,
        "alamat": alamat,
        "foto": foto == null ? null : foto,
      };
}
