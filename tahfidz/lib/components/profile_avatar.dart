// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  // const ProfilePicture({Key? key}) : super(key: key);

  final double? sizeAvatar;
  final double? heightBtn;
  final double? sizeIcon;
  final double? widthBtn;
  final String? avatar;
  dynamic onPress;
  ProfilePicture(
      {this.sizeAvatar,
      this.heightBtn,
      this.widthBtn,
      this.sizeIcon,
      this.onPress,
      this.avatar});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeAvatar!,
      width: sizeAvatar!,
      child: Stack(
        // fit: StackFit.expand,
        // clipBehavior: Clip.none,
        children: [
          // ),

          avatar == null
              ? Image.asset('assets/images/asatidz.png')
              : Image.network(avatar!),
          Positioned(
            right: 3,
            bottom: 3,
            child: SizedBox(
              height: heightBtn,
              width: widthBtn,
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.white),
                    ),
                    // primary: Colors.white,
                    backgroundColor: Color.fromARGB(255, 15, 75, 255),
                  ),
                  onPressed: onPress,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: sizeIcon,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
