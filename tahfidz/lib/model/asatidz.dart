// To parse this JSON data, do
//
//     final asatid = asatidFromJson(jsonString);

import 'dart:convert';

List<Asatid> asatidFromJson(String str) =>
    List<Asatid>.from(json.decode(str).map((x) => Asatid.fromJson(x)));

String asatidToJson(List<Asatid> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Asatid {
  Asatid({
    this.name,
    this.avatar,
    this.idRole,
    this.alamat,
    this.email,
    this.noHp,
    this.tanggalLahir,
    this.tempatLahir,
    this.id,
  });

  String? name;
  String? avatar;
  int? idRole;
  String? alamat;
  String? email;
  String? noHp;
  DateTime? tanggalLahir;
  String? tempatLahir;
  String? id;

  factory Asatid.fromJson(Map<String, dynamic> json) => Asatid(
        name: json["name"],
        avatar: json["avatar"],
        idRole: json["id_role"],
        alamat: json["alamat"],
        email: json["email"],
        noHp: json["no_hp"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        tempatLahir: json["tempat_lahir"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatar": avatar,
        "id_role": idRole,
        "alamat": alamat,
        "email": email,
        "no_hp": noHp,
        "tanggal_lahir": tanggalLahir?.toIso8601String(),
        "tempat_lahir": tempatLahir,
        "id": id,
      };
}
