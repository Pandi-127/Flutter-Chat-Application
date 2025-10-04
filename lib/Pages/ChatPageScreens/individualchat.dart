import 'package:chat_app/Datas/ProfileDataModel.dart';
import 'package:chat_app/Pages/CameraPage.dart';
import 'package:chat_app/Pages/CameraPageSCreens/CameraScreen.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class IndividualChat extends StatefulWidget {
  final ProfileDataModel chats;

  IndividualChat({super.key, required this.chats});

  @override
  State<IndividualChat> createState() => _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> {
  TextEditingController myController = TextEditingController();
  bool clickedEmojiIcon = false;
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        setState(() {
          clickedEmojiIcon = false;
        });
      }
    });
  }

  @override
  void dispose() {
    myController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 70,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: Icon(Icons.arrow_back, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            CircleAvatar(
              radius: 23,
              child: Icon(widget.chats.isGroup ? Icons.groups : widget.chats.iconModel),
            ),
          ],
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: Text(widget.chats.Name, style: TextStyle(color: Colors.white)),
            ),
            Text(widget.chats.lastMessage,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white)),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.video_call, color: Colors.white),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.call, color: Colors.white),
          ),
          SizedBox(width: 0),
          Theme(
            data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(color: Colors.white),
              popupMenuTheme: PopupMenuThemeData(color: Colors.white),
            ),
            child: PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(child: Text("Settings")),
                  PopupMenuItem(child: Text("New Contact")),
                  PopupMenuItem(child: Text("New Group")),
                  PopupMenuItem(child: Text("Broadcast")),
                ];
              },
            ),
          ),
        ],
        backgroundColor: Color(0xFF049347),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          onWillPop: () {
            if (clickedEmojiIcon) {
              setState(() {
                clickedEmojiIcon = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            margin: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextFormField(
                              focusNode: myFocusNode,
                              controller: myController,
                              maxLines: 5,
                              minLines: 1,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      myFocusNode.unfocus();
                                      myFocusNode.canRequestFocus = false;
                                      clickedEmojiIcon = !clickedEmojiIcon;
                                    });
                                  },
                                  icon: Icon(Icons.emoji_emotions, color: Colors.green),
                                ),
                                hintText: "Type your message",
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (build)=>CameraPage()));
                                      },
                                      icon: Icon(Icons.camera_alt),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (builder) => bottomSheetCustom(),
                                        );
                                      },
                                      icon: Icon(Icons.attach_file),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          child: Icon(Icons.mic, color: Colors.white),
                          radius: 27,
                          backgroundColor: Colors.green,
                        ),
                      ],
                    ),
                    clickedEmojiIcon ? emojiPad() : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheetCustom() {
    return Container(
      height: 265,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              //First Row of Elements in Attach File Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreator(Icons.insert_drive_file, Colors.indigo, "Documents"),
                  SizedBox(width: 40),
                  InkWell(
                      onTap:()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (build) => CameraScreen()));
                      },
                      child: iconCreator(Icons.camera_alt, Colors.purple, "Camera")),
                  SizedBox(width: 40),
                  iconCreator(Icons.insert_photo, Colors.pinkAccent, "Photo"),
                ],
              ),
              SizedBox(height: 27),

              //Secound Row Of Elements in Attach File Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreator(Icons.audiotrack, Colors.orangeAccent, "Audio"),
                  SizedBox(width: 40),
                  iconCreator(Icons.location_on_rounded, Colors.teal, "Location"),
                  SizedBox(width: 40),
                  iconCreator(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreator(IconData myIcon, Color myColor, String myString) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: myColor,
            radius: 27,
            child: Icon(myIcon, color: Colors.white),
          ),
        ),
        Text(
          myString,
          style: TextStyle(fontSize: 11.5),
        ),
      ],
    );
  }

  Widget emojiPad() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        setState(() {
          myController.text = myController.text + emoji.emoji;
        });
      },
    );
  }
}
