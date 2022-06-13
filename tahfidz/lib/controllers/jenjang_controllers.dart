import 'package:get/state_manager.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/model/Jenjang.dart';
import 'package:tahfidz/services/remote_services.dart';

class JenjangController extends GetxController {
  var listJenjang = <Jenjang>[].obs;
  var isLoading = true.obs;

  Jenjang? _selectedJenjang = Jenjang();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchJenjang();
  }

  void fetchJenjang() async {
    try {
      isLoading(true);
      var classes = await RemoteServices.fetchJenjang(SpUtil.getString(''));
      if (classes != null) {
        listJenjang.value = classes;
        // print(listJenjang);
      }
    } catch (e) {
      print('catch fetch jenjang controller $e');
    } finally {
      // print("Error");
      isLoading(false);
    }
  }

  Jenjang getSelectedJenjang() => _selectedJenjang!;

  void setSelectedJenjang(Jenjang jenjang) {
    _selectedJenjang = jenjang;
    update();
  }
  // void fetchPelajaranFromJenjang() async {}
}
