// ignore_for_file: unnecessary_null_comparison

import 'package:get/state_manager.dart';
import 'package:tahfidz/model/asatidz.dart';
import 'package:tahfidz/services/remote_services.dart';

class AsatidController extends GetxController {
  Asatidz dataAsatid = Asatidz();
  var isLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  Future<Asatidz?> getData() async {
    try {
      isLoading(true);
      var asatid =
          await RemoteServices.getUserInfo(dataAsatid.token.toString());
      if (asatid != null) {
        // List<Asatid> Asatide;
        dataAsatid.value = asatid;
        // print(dataAsatid);
        return dataAsatid;

        // return dataAsatid.token;
      }
    } finally {
      // print(e);
      isLoading(false);
    }
    return dataAsatid;
  }
}
