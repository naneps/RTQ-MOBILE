import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/model/santri.dart';

class CardSantri extends StatelessWidget {
  final Santri? santri;
  CardSantri({this.santri, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 85,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(29))),
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
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("${santri!.avatar}"),
                  )),
              SizedBox(width: 20),
              Expanded(
                flex: 4,
                child: Container(
                  // width: 400,
                  margin: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "${santri!.name}",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: greyColor),
                        ),
                      ),
                      Text(
                        "${santri!.jenjang}",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: greyColor),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                // height: 50,
                // width: 50,
                child: GestureDetector(
                  // onTap: onTap,
                  child: Icon(
                    LineIcons.alternateLongArrowRight,
                    color: Colors.black,
                    size: 34,
                  ),
                ),
              ),
            ],
          )
          // child: ,
          ),
    );
  }
}
