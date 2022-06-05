import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/model/Jenjang.dart';

class CardJenjang extends StatelessWidget {
  final Jenjang? jenjang;
  final int? nomor;
  dynamic onTap;

  CardJenjang({Key? key, this.jenjang, this.nomor, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    int count = 1;
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(10),
          height: 90,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(const Radius.circular(35))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/nomor.png',
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "${count + nomor!}",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  // width: 400,
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "${jenjang!.jenjang}",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: greyColor),
                        ),
                      ),
                      Text(
                        "Pelajaran",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: greyColor),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 30,
                  width: 150,
                  margin: const EdgeInsets.only(left: 50, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    "10 Santri }",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            ],
          )
          // child: ,
          ),
    );
  }
}
