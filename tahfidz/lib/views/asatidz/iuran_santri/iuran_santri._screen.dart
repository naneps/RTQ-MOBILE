import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:tahfidz/components/constants.dart';

class IuranSantriScreen extends StatefulWidget {
  const IuranSantriScreen({Key? key}) : super(key: key);

  @override
  State<IuranSantriScreen> createState() => _IuranSantriScreenState();
}

class _IuranSantriScreenState extends State<IuranSantriScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Iuran Santri"),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "Validasi Iuran Santri",
                style: GoogleFonts.poppins(
                    color: greyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(10),
              width: size.width,
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    child: Checkbox(
                      value: this.value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ), //Ch
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    color: Colors.blueAccent,
                    child: LineIcon.alternateMoneyBill(
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ahmad",
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "sudfah divalidasi",
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "2000",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
