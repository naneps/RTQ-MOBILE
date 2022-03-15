import 'package:flutter/material.dart';
import 'package:tahfidz/components/constants.dart';

class MyButton extends StatelessWidget {
  dynamic onPress;

  MyButton({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(29))),
      color: mainColor,
      child: ElevatedButton(
        child: Container(
          // color: mainColor,
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
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
          primary: mainColor,
          // onPrimary: mainColor,
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
