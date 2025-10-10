import 'package:camera/camera.dart';
import 'package:chat_app/Pages/CameraPageSCreens/showPicture.dart';
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
 late String lastPhotoPath;
 late String lastVideoPath;


  @override
  void initState() {
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
                      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                      child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: ()
                                            {
                                            Navigator.push(context, MaterialPageRoute(builder: (build)=>ShowPicture(imagepath: lastPhotoPath)));
                                            },
                                            icon: Icon(Icons.insert_photo_outlined,color: Colors.white,), ),
                                        SizedBox(width: 10,),
                                        IconButton(onPressed: (){}, icon:Icon(Icons.flash_off,color: Colors.white,) ),
                                        SizedBox(width: 10,),
                                        GestureDetector(
                                          onTap:  (){takePhoto();},
                                            onLongPress: (){
                                              //TODO:Implement Video future
                                            },
                                            child: Icon(Icons.panorama_fish_eye,size: 80,color: Colors.white,)) ,
                                        SizedBox(width: 10,),
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
      final XFile image = await _cameraController.takePicture();
      final directory =  await getApplicationDocumentsDirectory();
      final String filePath = '${directory.path}/${DateTime.now()}.jpg';
      lastPhotoPath =filePath;
      await image.saveTo(filePath);
    } catch (e) {
      print("Error while taking picture: $e");
    }
  }


}

