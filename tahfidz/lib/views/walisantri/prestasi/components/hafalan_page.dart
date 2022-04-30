import 'package:flutter/material.dart';
import 'package:tahfidz/views/walisantri/prestasi/components/widget_pelajaran.dart';

class HafalanPage extends StatelessWidget {
  const HafalanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "Hasil Penilaian Hafalan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 400,
            width: size.width,
            // color: mainColor,
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return WidgetPelajaran(
                  width: size.width,
                  nomor: "${1 + index}",
                  pelajaran: "Pelajaran",
                  nilai: "100",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
