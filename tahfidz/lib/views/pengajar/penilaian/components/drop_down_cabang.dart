// ignore_for_file: invalid_use_of_protected_member

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tahfidz/controllers/cabang_controller.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/model/cabang.dart';
import 'package:tahfidz/services/remote_services.dart';

class DropwDownCabang extends StatefulWidget {
  DropwDownCabang({Key? key}) : super(key: key);

  @override
  State<DropwDownCabang> createState() => _DropwDownCabangState();
}

class _DropwDownCabangState extends State<DropwDownCabang> {
  CabangController cabangController = Get.put(CabangController());
  JenjangController jenjangController = Get.put(JenjangController());

  Cabang cb1 = Cabang(namaCabang: "Lohbener");
  List<Cabang> cabang = <Cabang>[];

  @override
  void initState() {
    // cabangController.getAllCabang();
    RemoteServices.fetchCabang();
    cabangController.getAllCabang();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch(
        dropdownSearchDecoration: InputDecoration(
            hintText: "Pilih Cabang",
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            border: InputBorder.none),
        mode: Mode.BOTTOM_SHEET,
        // showSelectedItem: true,
        items: cabang,
        // popupItemDisabled: (String s) => s.startsWith('I'),
        onChanged: print,
        selectedItem: "Pilih Cabang");
  }
}
