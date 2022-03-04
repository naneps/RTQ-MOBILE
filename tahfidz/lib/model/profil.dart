import 'package:dio/dio.dart';

class Profil {
  Dio dio = new Dio();

  var data = new Map();

  var telepon;
  var nama;
  var keterangan;

  Future<String> getData() async {
    Response response;

    response =
        await dio.get('https://rtq-freelance.my.id/api/info_profil/' + telepon);

    return response.data;
  }
}
