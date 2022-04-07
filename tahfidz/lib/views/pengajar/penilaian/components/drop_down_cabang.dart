import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropwDownCabang extends StatefulWidget {
  DropwDownCabang({Key? key}) : super(key: key);

  @override
  State<DropwDownCabang> createState() => _DropwDownCabangState();
}

class _DropwDownCabangState extends State<DropwDownCabang> {
  var cabang = [
    ("Lohebenr"),
    {"Krangkeng"},
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownSearch(
        dropdownSearchDecoration: InputDecoration(
            hintText: "Pilih Cabang",
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: InputBorder.none),
        mode: Mode.MENU,
        // showSelectedItem: true,
        items: cabang,
        // popupItemDisabled: (String s) => s.startsWith('I'),
        onChanged: print,
        selectedItem: "Pilih Cabang");
  }
}
