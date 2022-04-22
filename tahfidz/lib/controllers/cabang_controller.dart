import 'package:get/get.dart';
import 'package:tahfidz/model/cabang.dart';
import 'package:tahfidz/services/remote_services.dart';

class CabangController extends GetxController {
  var listCabang = <Cabang>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCabang();
  }

  void getAllCabang() async {
    try {
      isLoading(true);
      var allCabang = await RemoteServices.fetchCabang();

      if (allCabang != null) {
        listCabang.value = allCabang;
      }
    } catch (e) {
      print("GetAllCabang : $e");
    } finally {
      isLoading(false);
    }
  }
}
