import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tahfidz/model/iuran.dart';

class IuranController extends GetxController {
  var listIuran = <Iuran>[].obs;
  var isLoading = true.obs;
  TextEditingController iuranController = TextEditingController();
}
