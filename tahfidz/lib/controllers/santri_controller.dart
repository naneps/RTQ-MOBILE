import 'package:get/state_manager.dart';
import 'package:tahfidz/model/santri.dart';
import 'package:tahfidz/services/remote_services.dart';

class SantriController extends GetxController {
  var listSantri = <Santri>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchSantri();
  }

  void fetchSantri() async {
    try {
      isLoading(true);
      var santries = await RemoteServices.fetchSantri();
      if (santries != null) {
        // List<Santri> santrie;
        listSantri.value = santries;
      }
    } finally {
      // print(e);
      isLoading(false);
    }
  }
}
