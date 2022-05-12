import 'package:get/state_manager.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/model/santri.dart';
import 'package:tahfidz/model/santri_by.dart';
import 'package:tahfidz/services/remote_services.dart';

class SantriController extends GetxController {
  var listSantri = <Santri>[].obs;
  // var listFilterSantri = <SantriBy>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchSantri();
    filterSantri();
  }

  void fetchSantri() async {
    try {
      isLoading(true);
      var santries =
          await RemoteServices.fetchSantri(SpUtil.getString('token')!);
      if (santries != null) {
        // List<Santri> santrie;
        listSantri.value = santries;
      }
    } finally {
      // print(e);
      isLoading(false);
    }
  }

  void filterSantri() async {
    // try {
    //   isLoading(true);
    //   // var santries = await RemoteServices.filterhSantri(
    //   //     SpUtil.getString('token')!, kdH);
    //   // if (santries != null) {
    //   //   // List<Santri> santrie;
    //   //   listFilterSantri.value = santries;
    //   }
    // } finally {
    //   // print(e);
    //   isLoading(false);
    // }
  }
}
