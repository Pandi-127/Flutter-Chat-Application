import 'package:chat_app/Datas/ProfileDataModel.dart';
import 'package:chat_app/Pages/ChatPage.dart';
import 'package:flutter/material.dart';
class Individualchat extends StatefulWidget {
  const Individualchat({super.key,required this.chats});
  final ProfileDataModel chats;

  @override
  State<Individualchat> createState() => _IndividualchatState();

}

class _IndividualchatState extends State<Individualchat> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
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
            body:Container() ,
          bottomNavigationBar:BottomNavigationBar(items: ) ,

        );
    }
}