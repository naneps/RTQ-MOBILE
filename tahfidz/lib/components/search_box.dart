import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/components/constants.dart';

class SearchBox extends StatelessWidget {
  String? labelText;
  SearchBox({this.labelText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // margin: EdgeInsets.all(10),
              // height: 21,
              // margin: EdgeInsets.only(top: ),
              // padding: EdgeInsets.,
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                cursorColor: mainColor,
                // textAlign: TextAlign.center,
                decoration: InputDecoration(
                  // labelText: 'Cari Jenjang',
                  hintText: "$labelText",
                  hintStyle: TextStyle(color: greyColor),
                  border: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // print("ok");
              },
              child: Icon(
                LineIcons.search,
                color: greyColor,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
