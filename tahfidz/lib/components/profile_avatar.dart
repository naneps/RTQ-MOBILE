import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/pages/pengajar/profile/profile_screen.dart';

class ProfilePicture extends StatelessWidget {
  // const ProfilePicture({Key? key}) : super(key: key);

  final double? sizeAvatar;
  final double? heightBtn;
  final double? sizeIcon;
  final double? widthBtn;

  const ProfilePicture(
      {this.sizeAvatar, this.heightBtn, this.widthBtn, this.sizeIcon});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeAvatar!,
      width: sizeAvatar!,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/avatar.png"),
          ),
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
                  onPressed: () {
                    Get.to(ProfileScreen(
                      telepon: SpUtil.getString('no_hp')!,
                    ));
                  },
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
