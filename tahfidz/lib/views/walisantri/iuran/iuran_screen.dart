import 'package:flutter/material.dart';
import 'package:tahfidz/components/constants.dart';

class IuranScreen extends StatelessWidget {
  const IuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Iuran"),
          centerTitle: true,
          // bottom: Preff ,
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            width: size.width,
            height: size.height,
            color: mainColor,
          ),
        )));
  }
}
