import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/model/halaqoh.dart';
import 'package:tahfidz/services/remote_services.dart';

class HalaqohController extends GetxController {
  var listHalaqoh = <Halaqoh>[].obs;
  var isLoading = true.obs;

  Halaqoh? _selectedHalaqoh = Halaqoh();

  @override
  void onInit() {
    // TODO: implement onInit
    getAllHalaqoh(null);
    super.onInit();
  }

  void getAllHalaqoh(filter) async {
    try {
      isLoading(true);
      var dataHalaqoh =
          await RemoteServices.fetchHalaqoh(SpUtil.getString("token")!, filter);
      if (dataHalaqoh != null) {
        listHalaqoh.value = dataHalaqoh;

        print("List Halaqoh $listHalaqoh");
      }
    } catch (e) {
      print("Catch getAllHalaqoh $e");
    } finally {
      isLoading(false);
    }
  }

  Halaqoh getSelectedHalaqoh() => _selectedHalaqoh!;

  void setSelectedHalaqoh(Halaqoh halaqoh) {
    _selectedHalaqoh = halaqoh;
    update();
  }
}
