import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WidgetFoto extends StatefulWidget {
  File? fileImage;
  WidgetFoto({required this.fileImage, Key? key}) : super(key: key);

  @override
  State<WidgetFoto> createState() => _WidgetFotoState();
}

class _WidgetFotoState extends State<WidgetFoto> {
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    var mainColor;
    return Container(
      height: MediaQuery.of(context).size.height / 1.94,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      clipBehavior: Clip.none,
      // color: Colors.grey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              width: 350,
              height: 350,
              child: (widget.fileImage != null)
                  ? Image.file(widget.fileImage!)
                  : SizedBox(
                      width: 300,
                      height: 300,
                      child: Material(
                        child: Image.asset('assets/images/guided.jpg',
                            fit: BoxFit.cover),
                      ),
                    ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: ElevatedButton(
                onPressed: () async {
                  getImageFromCanera();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.camera,
                    size: 40,
                    color: mainColor,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Future getImageFromCanera() async {
    var pickImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickImage != null) {
        setState(() {
          widget.fileImage = File(pickImage.path);
        });
      } else {
        print("no image  selecter");
      }
    });
  }
}
