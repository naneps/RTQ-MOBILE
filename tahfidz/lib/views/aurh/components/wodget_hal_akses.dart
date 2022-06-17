import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';

class WidgetHakAkses extends StatefulWidget {
  WidgetHakAkses(
      {Key? key, this.title, this.id, this.onTap, this.isSelected, this.image})
      : super(key: key);

  String? title;
  String? id;
  String? image;
  bool? isSelected = false;
  VoidCallback? onTap;
  @override
  State<WidgetHakAkses> createState() => _WidgetHakAksesState();
}

class _WidgetHakAksesState extends State<WidgetHakAkses> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        width: 150,
        height: 180,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: widget.isSelected! ? kMainColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: widget.isSelected! ? Colors.white : kMainColor,
              radius: 45,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/' + widget.image!),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.title!,
              style: GoogleFonts.poppins(
                color: widget.isSelected! ? Colors.white : kFontColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
