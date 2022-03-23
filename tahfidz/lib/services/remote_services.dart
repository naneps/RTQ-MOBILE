import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static var baseUrl = "http://rtq-freelance.my.id/api/";
}
