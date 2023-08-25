import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:san3a/modules/chat_screen/camera%20page/camera_veiw.dart';
import 'package:san3a/shared/component/component.dart';

List<CameraDescription>? camera;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key,this.onImageSend}) : super(key: key);
  final Function? onImageSend ;
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? cameraController;
  Future<void>? cameraValue;
  bool flash = false;
  bool isCameraFront= true;
  double transform = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cameraController = CameraController(camera![0], ResolutionPreset.high);
    cameraValue = cameraController!.initialize();
  }

  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
    cameraController!.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: CameraPreview(cameraController!));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.only(),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              flash=!flash;
                            });
                            flash ? cameraController!.setFlashMode(FlashMode.torch) : cameraController!.setFlashMode(FlashMode.off) ;
                          },
                          icon: Icon(
                            flash ?Icons.flash_on :
                            Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          )),
                      InkWell(
                        onTap: () {
                          takePhoto(context);
                        },
                        child: Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      IconButton(
                          onPressed: ()async{
                            setState(() {
                              isCameraFront = ! isCameraFront;
                              transform = transform + pi ;
                            });
                            int cameraPos =isCameraFront ? 0:1;
                            cameraController = CameraController(
                                camera![cameraPos], ResolutionPreset.high);
                            cameraValue = cameraController!.initialize();

                          },
                          icon: Transform.rotate(
                            angle:transform ,
                            child: Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Holding for video',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    XFile file = await cameraController!.takePicture();
    await cameraController!.takePicture();
    navigateTo(
        context,
        CameraViewPage(
          path: file.path,
            onImageSend:widget.onImageSend,
        ));
  }
}
