import 'package:chat_app/CustomeUi/CustomeCard.dart';
import 'package:chat_app/Datas/ProfileDataModel.dart';
import 'package:flutter/material.dart';
class Chatpage extends StatefulWidget {
   Chatpage({super.key});
  @override
  State<Chatpage> createState() => _ChatpageState();

}
List<ProfileDataModel> chats =[
  ProfileDataModel(Name: "NanDan", iconModel: Icons.person_2, isGroup:false, lastMessage: "hello", time:"4:19"),
  ProfileDataModel(Name: "Avan", iconModel:Icons.person_2 , isGroup: true, lastMessage: "lastMessage", time: "time")
];

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFBFB),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor:Color(0xFF049347),
        child: Icon(Icons.message),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context,intex)=>CustomeProfileCard(chat: chats[intex],),),
    );
  }
}
