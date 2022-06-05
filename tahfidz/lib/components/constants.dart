import 'package:flutter/material.dart';
import 'package:get/get.dart';

dynamic mainColor = Color.fromARGB(255, 255, 211, 105);
// dynamic greenColor = const Color.fromRGBO(67, 238, 135, 1);
dynamic greyColor = const Color.fromARGB(255, 116, 116, 116);
final kMainColor = Color.fromARGB(255, 255, 211, 105);
final kFontColor = Color.fromARGB(255, 57, 62, 70);
final kBackground = Color.fromARGB(255, 247, 247, 247);
final redColor = Color.fromARGB(255, 255, 95, 84);
final greenColor = Color.fromARGB(255, 107, 246, 121);

validateHakakses() {
  return Get.snackbar(
    'Peringatan',
    'Pilih Hak Akses Terlebih Dahulu',
    icon: Icon(
      Icons.error,
      color: Colors.white,
    ),
    backgroundColor: redColor,
    colorText: Colors.white,
    borderRadius: 10,
    snackPosition: SnackPosition.TOP,
    margin: EdgeInsets.all(10),
    duration: Duration(seconds: 2),
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
    icon: Icon(
      Icons.check,
      color: Colors.white,
    ),
    backgroundColor: greenColor,
    colorText: Colors.white,
    borderRadius: 10,
    snackPosition: SnackPosition.TOP,
    margin: EdgeInsets.all(10),
    duration: Duration(seconds: 2),
  );
}
