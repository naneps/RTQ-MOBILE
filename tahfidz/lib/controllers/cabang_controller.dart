import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
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
      var allCabang =
          await RemoteServices.fetchCabang(SpUtil.getString('token')!);

      if (allCabang != null) {
        listCabang.value = allCabang;
        print("List Cabang: $listCabang");
      }
    } catch (e) {
      print("GetAllCabang : $e");
    } finally {
      isLoading(false);
    }
  }
}
