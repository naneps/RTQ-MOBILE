// ignore_for_file: invalid_use_of_protected_member

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/controllers/cabang_controller.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/model/cabang.dart';
import 'package:tahfidz/services/remote_services.dart';

class DropwDownCabang extends StatefulWidget {
  DropwDownCabang({Key? key}) : super(key: key);
  final userToken = SpUtil.getString('token');
  @override
  State<DropwDownCabang> createState() => _DropwDownCabangState();
}

class _DropwDownCabangState extends State<DropwDownCabang> {
  CabangController cabangController = Get.put(CabangController());
  JenjangController jenjangController = Get.put(JenjangController());

  Cabang cb1 = Cabang(namaCabang: "Lohbener");
  Cabang cb2 = Cabang(namaCabang: "Lohb");
  Cabang cb3 = Cabang(namaCabang: "Lbener");

  @override
  void initState() {
    // cabangController.getAllCabang();
    RemoteServices.fetchCabang(SpUtil.getString('token')!);
    cabangController.getAllCabang();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      mode: Mode.BOTTOM_SHEET,
      items: [],
      dropdownSearchDecoration: InputDecoration(
        // labelText: "Custom BottomShet mode",
        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
      onChanged: print,
      selectedItem: cb1.namaCabang,
      showSearchBox: true,
      searchFieldProps: TextFieldProps(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
          labelText: "Pilih Cabang",
        ),
      ),
      popupTitle: Container(
        height: 50,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            'Country',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      popupShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    );
  }
}
