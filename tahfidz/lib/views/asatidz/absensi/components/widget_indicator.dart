import 'package:flutter/material.dart';
import 'package:tahfidz/views/asatidz/absensi/components/indicator_absensi.dart';

import '../../../../components/constants.dart';

class IndicatorAbsen extends StatelessWidget {
  const IndicatorAbsen({
    Key? key,
    required this.widhtBody,
  }) : super(key: key);

  final double widhtBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: heightBody / 6,
      width: widhtBody,
      // color: Colors.black,
      child: Stack(
        // fit: StackFit.expand,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            height: 100,
            width: widhtBody,
            child: Container(
              // color: mainColor,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                    bottomRight: Radius.circular(90),
                  ),
                  color: mainColor),
              // width: widhtBody,
            ),
          ),
          Positioned(
            top: 0,
            height: 150,
            width: widhtBody / 1.2,
            child: CardAbsensi(),
          ),
        ],
      ),
    );
  }
}

class InnerShadowBox extends StatelessWidget {
  final Widget? child;
  InnerShadowBox({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        boxShadow: [
          //CSS: inset 0px 4px 6px rgba(8, 56, 73, 0.5)
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // shadow color
            offset: Offset(4, 4),
          ),
          BoxShadow(
            offset: Offset(0, 4),

            blurRadius: 3,
            // color: Colors.grey, // shadow color
            color: Color(0xFFF9F8F9), // background color
          ),
        ],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 5),
        child: child,
      ),
    );
  }
}
