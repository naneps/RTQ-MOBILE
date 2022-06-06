import 'package:flutter/material.dart';
import 'package:get/get.dart';

dynamic mainColor = const Color.fromARGB(255, 255, 211, 105);
// dynamic greenColor = const Color.fromRGBO(67, 238, 135, 1);
dynamic greyColor = const Color.fromARGB(255, 116, 116, 116);
var kMainColor = const Color.fromARGB(255, 255, 211, 105);
var kFontColor = const Color.fromARGB(255, 57, 62, 70);
var kBackground = const Color.fromARGB(255, 247, 247, 247);
var redColor = const Color.fromARGB(255, 255, 95, 84);
var greenColor = const Color.fromARGB(255, 107, 246, 121);

validateHakakses() {
  return Get.snackbar(
    'Peringatan',
    'Pilih Hak Akses Terlebih Dahulu',
    icon: const Icon(
      Icons.error,
      color: Colors.white,
    ),
    backgroundColor: redColor,
    colorText: Colors.white,
    borderRadius: 10,
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 2),
    showProgressIndicator: true,
  );
}

validateAuth() {
  return Get.snackbar(
    'Autentikasi Gagal',
    'Periksa Telepon dan Kata Sandi Anda',
    icon: const Icon(
      Icons.error,
      color: Colors.white,
    ),
    backgroundColor: redColor,
    colorText: Colors.white,
    borderRadius: 10,
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 2),
  );
}

showSuccessLogin(label) {
  return Get.snackbar(
    'Berhasil',
    'Anda Berhasil Masuk Sebagai $label',
    icon: const Icon(
      Icons.check,
      color: Colors.white,
    ),
    backgroundColor: greenColor,
    colorText: Colors.white,
    borderRadius: 10,
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 2),
  );
}
