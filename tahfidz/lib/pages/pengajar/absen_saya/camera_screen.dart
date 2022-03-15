import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tahfidz/components/constants.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;

  Future<void> initializeCamera() async {
    var cameras = await availableCameras();

    controller = CameraController(cameras[1], ResolutionPreset.medium);
    await controller!.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }

  Future<File> getPicture() async {
    Directory root = await getApplicationDocumentsDirectory();
    String directoryPath = '${root.path}/Guided_Camrea';
    await Directory(directoryPath).create(recursive: true);
    String filePath = '$directoryPath/${DateTime.now()}.jpg';

    try {
      await controller!.takePicture();
    } catch (e) {
      print(e);
    }
    return File(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        color: greenColor,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: initializeCamera(),
          builder: (BuildContext context, AsyncSnapshot snapshot) =>
              (snapshot.connectionState == ConnectionState.done)
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 0,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height /
                                controller!.value.aspectRatio,
                            child: SizedBox(
                              width: 300,
                              height: 300,
                              child: Material(
                                child: CameraPreview(controller!),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 270,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (!controller!.value.isTakingPicture) {
                                  File result = await getPicture();
                                  print(result);
                                  Navigator.pop(context, result);
                                }
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
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.camera,
                                  size: 40,
                                  color: mainColor,
                                ),
                              ),
                            ))
                      ],
                    )
                  : Center(
                      child: SizedBox(
                        height: 20,
                        width: 29,
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
