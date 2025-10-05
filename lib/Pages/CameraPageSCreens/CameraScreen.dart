import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

 late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
 late Future<void> cameraValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder( builder:(Context,Snapshot){
          if(Snapshot.connectionState == ConnectionState.done){
            return CameraPreview(_cameraController);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }, future: cameraValue,),
        Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 75,vertical: 10),
                      child: Row(

                                      children: [
                                        IconButton(onPressed: (){}, icon:Icon(Icons.flash_off,color: Colors.white,) ),
                                        SizedBox(width: 30,),
                                        IconButton(onPressed: (){
                                          takePhoto();
                                        }, icon:Icon(Icons.panorama_fish_eye,size: 80,color: Colors.white,) ),
                                        SizedBox(width: 30,),
                                        IconButton(onPressed: (){}, icon:Icon(Icons.flip_camera_ios_outlined,color: Colors.white,) ),

                                      ],
                                    ),
                    )]),
              ),
            )
      ],
    );
  }
  void takePhoto() async {
    try {
      final XFile file = await _cameraController.takePicture();
      print("Photo saved at: ${file.path}");
    } catch (e) {
      print("Error while taking picture: $e");
    }
  }


}
