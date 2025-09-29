import 'package:chat_app/Datas/ProfileDataModel.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
class Individualchat extends StatefulWidget {
   Individualchat({super.key,required this.chats});
  final ProfileDataModel chats;
  State<Individualchat> createState() => _IndividualchatState();
}

class _IndividualchatState extends State<Individualchat> {
   TextEditingController mycontroller = TextEditingController();
   bool clickedemojiIcon = false;
   FocusNode myfocusNode = FocusNode();
   @override
   void initState(){
     super.initState();
     myfocusNode.addListener((){
       if(myfocusNode.hasFocus){
         clickedemojiIcon = false;
       }
     });
   }


    Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
            appBar: AppBar(
                leadingWidth: 70,
                    leading:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(child: Icon(Icons.arrow_back,color:Colors.white,),onTap:(){Navigator.pop(context);} ,),
                        CircleAvatar(radius: 23,child: Icon(widget.chats.isGroup ?widget.chats.iconModel: Icons.groups,),),
                      ],),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(onTap:(){},child: Text(widget.chats.Name,style: TextStyle(color: Colors.white),)),
                      Text(widget.chats.lastMessage,style: TextStyle(fontSize:12,fontWeight: FontWeight.w300,color: Colors.white),)
                    ],
              ),
            actions: [
              GestureDetector(
                  onTap:(){},
                  child: Icon(Icons.video_call,color: Colors.white,)),
              SizedBox(width: 10,),
              GestureDetector(
                  onTap:(){},
                  child: Icon(Icons.call,color: Colors.white,)),
              SizedBox(width: 0,),
              Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(color: Colors.white),
                  popupMenuTheme: PopupMenuThemeData(color: Colors.white)
                ),
                child: PopupMenuButton<String>(
                    itemBuilder:(BuildContext context ){
                      return [PopupMenuItem(child:Text("Setings") ),
                              PopupMenuItem(child: Text("New Condact")),
                              PopupMenuItem(child: Text("New group")),
                              PopupMenuItem(child: Text("Broadcast"))
                      ];
                    }
                ),
              )
            ],
            backgroundColor: Color(0xFF049347),
            ),
            body:Container(
              height:MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width,
              child: WillPopScope(
                onWillPop: (){
                  if(clickedemojiIcon){
                     setState(() {
                       clickedemojiIcon = false;
                     });
                  }else{
                    Navigator.pop(context);
                  }
                  return Future.value(false);
                },
                child: Stack(children: [
                  ListView(),
                  Align(
                    alignment: Alignment.bottomCenter,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width-60,

                              child: Card(
                                margin:EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                                child: TextFormField(
                                  focusNode: myfocusNode,
                                  controller:mycontroller,
                                  maxLines:5,
                                  minLines: 1,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration:InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: IconButton(
                                        onPressed: (){setState(() {
                                          myfocusNode.unfocus();
                                          myfocusNode.canRequestFocus=false;
                                          clickedemojiIcon = !clickedemojiIcon;
                                        });},
                                        icon: Icon(Icons.emoji_emotions,color: Colors.green,)),
                                    hintText: "Type your Message",
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(onPressed: (){print(mycontroller.text);}, icon:Icon(Icons.camera_alt)),
                                        IconButton(onPressed:(){}, icon:Icon(Icons.attach_file))],
                                    ),
                                  )
                                ),
                              ),

                            ),
                                         CircleAvatar(child:Icon(Icons.mic,color: Colors.white,),radius: 27,backgroundColor: Colors.green,)  ],
                        ),
                        clickedemojiIcon?emojipad():Container(),
                      ],
                    ),
                  ),
                ],),
              ),
            ) ,

        );
    }


  Widget emojipad(){
    return EmojiPicker(
      onEmojiSelected:(Category,emoji){
        setState(() {
          mycontroller.text = mycontroller.text+emoji.emoji;
        });

      },
    );
  }
}
