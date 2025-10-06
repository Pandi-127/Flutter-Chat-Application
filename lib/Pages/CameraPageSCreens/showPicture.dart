import 'dart:io';
import 'package:flutter/material.dart';

class ShowPicture extends StatelessWidget {
  final String imagepath;

  const ShowPicture({super.key, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Icon(Icons.crop_rotate_outlined, color: Colors.white, size: 30),
          SizedBox(width: 10),
          Icon(Icons.emoji_emotions_outlined, color: Colors.white, size: 30),
          SizedBox(width: 10),
          Icon(Icons.title, color: Colors.white, size: 30),
          SizedBox(width: 10),
          Icon(Icons.edit, color: Colors.white, size: 30),
          SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          //Show the image full screen
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(height: MediaQuery.of(context).size.height-90,
              child: Positioned.fill(
                child: Image.file(
                  File(imagepath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          //Caption input at the bottom
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black.withOpacity(0.3),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style:TextStyle(
                        color: Colors.white
                      ),
                      maxLines:4,
                      minLines: 1,
                      decoration: const InputDecoration(
                        hintText: "Add Caption ...",
                        border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.add_photo_alternate, color: Colors.white),
                      ),
                    ),
                  ),
                  IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_circle_right_rounded,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
