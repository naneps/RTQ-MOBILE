// ignore: file_names
import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final Text? title;
  final Icon? icon;
  final Color? color;
  final dynamic onTap;
  ItemMenu({this.onTap, this.title, this.icon, this.color});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8,
        color: Colors.transparent,
        child: Container(
          width: (screenWidth - 40 - 17) / 2.8,
          height: (screenWidth - 40 - 17 - 30) / 2.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: icon,
                margin: EdgeInsets.only(bottom: 10),
              ),
              title!,
            ],
          ),
        ),
      ),
    );
  }
}
