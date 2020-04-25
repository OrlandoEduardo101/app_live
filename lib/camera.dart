import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  var cameras;
  Camera(this.cameras);
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {

  CameraController _cameraController;
  int cam = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(widget.cameras[cam], ResolutionPreset.medium);
    _cameraController.initialize().then((_){
      if(!mounted){
        print("Camera não inicializou");
        return;
      }

      setState(() {
        
      });

    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(!_cameraController.value.isInitialized){
      return Container(
        color: Colors.white,
        child: Center(
          child: Text("Câmera falhou!"),
        ),
      );
    }

    return Center(
      child: Column(
      children: <Widget>[
        SizedBox(
          height: 400,
          width: 300,
          child: Center(
      child: AspectRatio(
        aspectRatio: _cameraController.value.aspectRatio,
        child: CameraPreview(_cameraController),
      )
    )
        ),
    GestureDetector(
      child: Icon(Icons.arrow_drop_down_circle),
      onTap: (){
        if(cam==0){
          setState(() {
            cam = 1;
          }
          );
        }else{
            setState(() {
              cam = 0;
            });
          }
      },
    )
      ],
    )
    );

  }
}