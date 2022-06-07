// ignore_for_file: invalid_use_of_protected_member

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/controllers/halaqoh_controllers.dart';
import 'package:tahfidz/services/remote_services.dart';

import '../../../../model/halaqoh.dart';

class DropwDownCabang extends StatefulWidget {
  DropwDownCabang({Key? key}) : super(key: key);
  final userToken = SpUtil.getString('token');
  @override
  State<DropwDownCabang> createState() => _DropwDownCabangState();
}

class _DropwDownCabangState extends State<DropwDownCabang> {
  // JenjangController jenjangController = Get.put(JenjangController());
  HalaqohController halaqohController = Get.put(HalaqohController());
  // Halaqoh? selectedHalaqoh;
  @override
  Widget build(BuildContext context) {
    // print("BUild Dropdown");
    // print(halaqohController.listHalaqoh.value);
    return DropdownSearch<Halaqoh>(
      selectedItem: halaqohController.getSelectedHalaqoh(),
      showSearchBox: true,
      showSelectedItems: true,
      compareFn: (i, s) => i?.isEqual(s!) ?? false,
      mode: Mode.BOTTOM_SHEET,
      dropdownSearchDecoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
          border: OutlineInputBorder(borderSide: BorderSide.none)),
      onFind: (filter) {
        return RemoteServices.fetchHalaqoh(widget.userToken!, filter);
      },
      onChanged: (data) {
        setState(() {
          halaqohController.setSelectedHalaqoh(data!);
        });
      },
      dropdownBuilder: _customDropDownExample,
      popupItemBuilder: _customPopupItemBuilderExample2,
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
            'Halaqoh',
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

  Widget _customDropDownExample(BuildContext context, Halaqoh? halaqoh) {
    if (halaqoh == null) {
      return Container();
    }

    return Container(
      child: (halaqoh.kodeHalaqah == null)
          ? ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.location_on_rounded,
                    color: mainColor,
                    size: 40,
                  )),
              title: Text("Pilih Cabang"),
            )
          : ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.location_on_rounded,
                    color: mainColor,
                    size: 40,
                  )),
              title: Text(halaqoh.namaTempat!),
              subtitle: Text(
                halaqoh.namaDaerah.toString(),
              ),
            ),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, Halaqoh? item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
          selectedTileColor: mainColor,
          selectedColor: mainColor,
          selected: isSelected,
          title: Text(item!.namaTempat ?? ''),
          subtitle: Text(item.namaDaerah.toString()),
          leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.location_on_rounded,
                size: 40,
                color: mainColor,
              ))),
    );
  }
}
