import 'package:camera/camera.dart';
import 'package:chat_app/MyApp.dart';
import 'package:chat_app/Pages/CameraPageSCreens/CameraScreen.dart';
import 'package:flutter/material.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
   cameras = await availableCameras();
  runApp(const Myapp());

}
