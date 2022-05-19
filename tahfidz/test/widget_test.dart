import 'package:http/http.dart' as http;
import 'package:tahfidz/model/pelajaran.dart';

void main() async {
  Future<List<Pelajaran>?> fetchPelajaran() async {
    var url = Uri.parse(
        'https://623aa9b8b5292b8bfcb807ee.mockapi.io/rtq/api/pelajaran');
    // print(url);
    var resposne = await http.get(url);

    print("StatusCode Fetch Pelajaran : ${resposne.statusCode}");
    if (resposne.statusCode == 200) {
      var jsonString = resposne.body;
      // print(pelajaranFromJson(jsonString));
      return pelajaranFromJson(jsonString);
    }

    return [];
  }

  await fetchPelajaran();
}
