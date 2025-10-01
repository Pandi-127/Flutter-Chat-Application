import 'package:chat_app/Datas/ProfileDataModel.dart';
import 'package:chat_app/Pages/ChatPage.dart';
import 'package:chat_app/Pages/screens/individualchat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CustomeProfileCard extends StatelessWidget {
   CustomeProfileCard( {super.key, required this.chat});
  final ProfileDataModel chat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>IndividualChat(chats: chat,)));
      },
      child: ListTile(
        leading:CircleAvatar(radius: 20, child: Icon(chat.isGroup? Icons.groups:chat.iconModel,)),
        title: Text(chat.Name,style: TextStyle(fontWeight: FontWeight.w500),),
        subtitle: Row(
            children: [
              Icon(Icons.done_all,color: Colors.blue,), SizedBox(width: 5,),
              Text(chat.lastMessage,style: TextStyle(fontWeight:FontWeight.w300),)]),
        trailing:chat.isnewconduct? Text("Invite",style:TextStyle(color: Colors.green,fontWeight: FontWeight.w800) ,):Text(chat.time),
      ),
    );
  }
}
