// To parse this JSON data, do
//
//     final nilai = nilaiFromJson(jsonString);

import 'dart:convert';

List<Nilai> nilaiFromJson(String str) =>
    List<Nilai>.from(json.decode(str).map((x) => Nilai.fromJson(x)));

String nilaiToJson(List<Nilai> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Nilai {
  Nilai({
    this.id,
    this.idPelajaran,
    this.nisSantri,
    this.nilai,
  });

  String? id;
  String? idPelajaran;
  String? nisSantri;
  double? nilai = 0;

  factory Nilai.fromJson(Map<String, dynamic> json) => Nilai(
        id: json["id"],
        idPelajaran: json["id_pelajaran"],
        nisSantri: json["nis_santri"],
        nilai: json["nilai"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_pelajaran": idPelajaran,
        "nis_santri": nisSantri,
        "nilai": nilai,
      };
}
