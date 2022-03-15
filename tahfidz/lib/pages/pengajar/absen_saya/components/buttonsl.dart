import 'package:flutter/material.dart';
import 'package:tahfidz/components/constants.dart';

class MyButton extends StatelessWidget {
  dynamic onPress;
  dynamic icon;
  Color? color;
  MyButton({Key? key, this.onPress, this.icon, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 26,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Absen !",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 4,
        primary: color,
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      onPressed: onPress,
    );
  }
}
