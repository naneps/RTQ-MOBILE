// ignore_for_file: invalid_use_of_protected_member

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/controllers/cabang_controller.dart';
import 'package:tahfidz/controllers/jenjang_controllers.dart';
import 'package:tahfidz/services/remote_services.dart';

class DropwDownCabang extends StatefulWidget {
  DropwDownCabang({Key? key}) : super(key: key);
  final userToken = SpUtil.getString('token');
  static String? selectedCabang = "";
  @override
  State<DropwDownCabang> createState() => _DropwDownCabangState();
}

class _DropwDownCabangState extends State<DropwDownCabang> {
  CabangController cabangController = Get.put(CabangController());
  JenjangController jenjangController = Get.put(JenjangController());

  // get selectedCabang => widget.sel;
  // String selectedCabang = "";

  @override
  void initState() {
    // cabangController.getAllCabang();
    RemoteServices.fetchCabang(SpUtil.getString('token')!);
    cabangController.getAllCabang();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      // listcabang = cabangController.listCabang.value;
    });

    return DropdownSearch<String>(
      mode: Mode.BOTTOM_SHEET,
      items: cabangController.listCabang,
      dropdownSearchDecoration: const InputDecoration(
        // labelText: "Custom BottomShet mode",
        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
      onChanged: (value) {
        print(value);
        setState(() {
          DropwDownCabang.selectedCabang = value;
        });
      },
      // selectedItem: cb1,
      showSearchBox: true,
      searchFieldProps: TextFieldProps(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
          labelText: "Pilih Cabang",
        ),
      ),
      popupTitle: Container(
        height: 50,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: const Center(
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
      popupShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    );
  }
}
