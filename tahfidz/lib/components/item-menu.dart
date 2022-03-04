import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final String? title;
  final dynamic icon;
  final dynamic color;
  ItemMenu({this.title, this.icon, this.color});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 8,
      color: Colors.transparent,
      child: Container(
        width: (screenWidth - 40 - 17) / 2.8,
        height: (screenWidth - 40 - 17 - 30) / 2.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(color),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Text(
              title!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
