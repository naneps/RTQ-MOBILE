// To parse this JSON data, do
//
//     final santri = santriFromJson(jsonString);

import 'dart:convert';

List<Santri> santriFromJson(String str) =>
    List<Santri>.from(json.decode(str).map((x) => Santri.fromJson(x)));

String santriToJson(List<Santri> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Santri {
  Santri({
    this.name,
    this.avatar,
    this.jenjang,
    this.id,
  });

  String? name;
  String? avatar;
  String? jenjang;
  String? id;

  factory Santri.fromJson(Map<String, dynamic> json) => Santri(
        name: json["name"],
        avatar: json["avatar"],
        jenjang: json["jenjang"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatar": avatar,
        "jenjang": jenjang,
        "id": id,
      };
}
