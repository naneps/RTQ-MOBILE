import 'dart:io';

import 'package:get/get.dart';

class AbsensiController extends GetxController {
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    // createAbsen(body, file);
  }

  @override
  void onClose() {
    super.onClose();
  }

  static Future<bool?> createAbsen(Map<String, dynamic> body, File file) async {
    print("Method Create Absen");

    return null;
  }

  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
