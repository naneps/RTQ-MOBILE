// To parse this JSON data, do
//
//     final jenjang = jenjangFromJson(jsonString);

import 'dart:convert';

List<Jenjang> jenjangFromJson(String str) =>
    List<Jenjang>.from(json.decode(str).map((x) => Jenjang.fromJson(x)));

String jenjangToJson(List<Jenjang> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Jenjang {
  Jenjang({
    this.id,
    this.jenjang,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? jenjang;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Jenjang.fromJson(Map<String, dynamic> json) => Jenjang(
        id: json["id"],
        jenjang: json["jenjang"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenjang": jenjang,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
  bool isEqual(Jenjang model) {
    return id == model.id;
  }
}
