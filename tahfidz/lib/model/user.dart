import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User(
      {this.id,
      this.nama,
      this.email,
      this.alamat,
      this.idRole,
      this.noHp,
      this.gambar,
      this.tempatLahir,
      this.tanggalLahir,
      this.token,
      this.createdAt,
      this.updatedAt,
      this.keterangan});

  int? id;
  String? nama;
  String? email;
  String? alamat;
  String? idRole;
  String? noHp;
  String? gambar;
  String? tempatLahir;
  DateTime? tanggalLahir;
  String? token;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? keterangan;

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      nama: json["nama"],
      email: json["email"],
      alamat: json["alamat"],
      idRole: json["id_role"],
      noHp: json["no_hp"],
      gambar: json["gambar"],
      tempatLahir: json["tempat_lahir"],
      tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
      token: json["token"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      keterangan: json['keterangan']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "email": email,
        "alamat": alamat,
        "id_role": idRole,
        "no_hp": noHp,
        "gambar": gambar,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir":
            "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "token": token,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "keterangan": keterangan
      };
}
