import 'package:flutter/material.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/splashScreen.dart';
import 'package:tahfidz/pages/pengajar/penilaian/components/item_jenjang.dart';

class PenilaiainScreen extends StatefulWidget {
  const PenilaiainScreen({Key? key}) : super(key: key);

  @override
  State<PenilaiainScreen> createState() => _PenilaiainScreenState();
}

class _PenilaiainScreenState extends State<PenilaiainScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("Penilaian "),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          color: mainColor,
          height: height,
          width: width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Daftar Jenjang ",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              CardJenjang(),
              Card(
                child: ListTile(
                  title: Text(
                    "Tilawah 1 ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  leading: CircleAvatar(
                    child: Icon(Icons.book),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
