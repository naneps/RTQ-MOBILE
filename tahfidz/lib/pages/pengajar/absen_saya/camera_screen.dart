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

  Future<File> takePicture() async {
    Directory root = await getTemporaryDirectory();
    String directoryPath = '${root.path}/Guided_Camrea';
    await Directory(directoryPath).create(recursive: true);
    String filePath = '${directoryPath}/${DateTime.now()}.jpg';

    try {
      await controller!.takePicture();
    } catch (e) {
      return null!;
    }
    return File(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: initializeCamera(),
        builder: (BuildContext context, AsyncSnapshot snapshot) =>
            (snapshot.connectionState == ConnectionState.done)
                ? Stack(children: [
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width *
                              1.5 /
                              controller!.value.aspectRatio,
                          child: CameraPreview(controller!),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (!controller!.value.isTakingPicture) {
                              File result = await takePicture();
                              print(result);
                              Navigator.pop(context, result);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(90),
                              ),
                            ),
                          ),
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: Icon(
                              Icons.camera,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container()
                  ])
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
    );
  }
}
