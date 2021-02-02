import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camerascreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MaterialApp(
    title:'Camera #1',
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: CameraScreen(camera: firstCamera),
  ));
}
