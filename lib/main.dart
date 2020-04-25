import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'login.dart';

List<CameraDescription> cameras;

Future<Null> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(cameras),
  ));
}
