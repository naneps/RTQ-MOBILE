import 'package:http/http.dart' as http;
import 'package:tahfidz/model/Jenjang.dart';

class RemoteServices {
  static var client = http.Client();
  static var baseUrl = "http://rtq-freelance.my.id/api/";

  static Future<List<Jenjang>?> fetchJenjang() async {
    var resposne = await client.get(Uri.parse(
        "https://623aa9b8b5292b8bfcb807ee.mockapi.io/rtq/api/jenjang"));
    if (resposne.statusCode == 200) {
      var jsonString = resposne.body;
      return jenjangFromJson(jsonString);
    } else {
      return null;
    }
  }
}
