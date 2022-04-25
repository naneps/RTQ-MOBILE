import 'package:get/state_manager.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/model/Jenjang.dart';
import 'package:tahfidz/services/remote_services.dart';

class JenjangController extends GetxController {
  var listJenjang = <Jenjang>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchJenjang();
  }

  void fetchJenjang() async {
    try {
      isLoading(true);
      var classes =
          await RemoteServices.fetchJenjang(SpUtil.getString('token')!);
      if (classes != null) {
        listJenjang.value = classes;
      }
    } catch (e) {
      print('catch fetch jenjang controller $e');
    } finally {
      // print("Error");
      isLoading(false);
    }
  }

  // void fetchPelajaranFromJenjang() async {}
}
