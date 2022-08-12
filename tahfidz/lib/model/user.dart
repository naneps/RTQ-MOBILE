// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.nama,
    this.email,
    this.alamat,
    this.noHp,
    this.gambar,
    this.tempatLahir,
    this.tanggalLahir,
    this.jenisKelamin,
    this.token,
    this.status,
    this.keterangan,
    this.idRole,
  });

  int? id;
  String? nama;
  String? email;
  String? alamat;
  String? noHp;
  String? gambar;
  String? tempatLahir;
  DateTime? tanggalLahir;
  String? jenisKelamin;
  String? token;
  int? status;
  String? keterangan;
  int? idRole;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nama: json["nama"],
        email: json["email"],
        alamat: json["alamat"],
        noHp: json["no_hp"],
        gambar: json["gambar"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        token: json["token"],
        status: json["status"],
        keterangan: json["keterangan"],
        idRole: json["id_role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "email": email,
        "alamat": alamat,
        "no_hp": noHp,
        "gambar": gambar,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir":
            "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "token": token,
        "status": status,
        "keterangan": keterangan,
        "id_role": idRole,
      };
}
