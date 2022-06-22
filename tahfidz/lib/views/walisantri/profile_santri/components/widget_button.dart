import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../components/constants.dart';

class WudgetButton extends StatelessWidget {
  WudgetButton({
    this.label,
    this.color,
    this.ontap,
    Key? key,
  }) : super(key: key);
  String? label;
  VoidCallback? ontap;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color ?? kMainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label!,
          style: GoogleFonts.poppins(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
