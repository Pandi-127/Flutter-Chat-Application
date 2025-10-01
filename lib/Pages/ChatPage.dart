import 'package:chat_app/CustomeUi/CustomeCard.dart';
import 'package:chat_app/Datas/ProfileDataModel.dart';
import 'package:chat_app/Pages/screens/AddContact.dart';
import 'package:flutter/material.dart';
class Chatpage extends StatefulWidget {
   Chatpage({super.key});
  @override
  State<Chatpage> createState() => _ChatpageState();

}
List<ProfileDataModel> chats =[
  ProfileDataModel(Name: "NanDan", iconModel: Icons.person_2, isGroup:false, lastMessage: "hello", time:"4:19",isnewconduct: false,Status: "jhsdf"),
  ProfileDataModel(Name: "Avan", iconModel:Icons.person_2 , isGroup: true, lastMessage: "lastMessage", time: "time",isnewconduct: false,Status: "dbsf")
];

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFBFB),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (build)=>AddContact()));
        },
        backgroundColor:Color(0xFF049347),
        child: Icon(Icons.message),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context,intex)=>CustomeProfileCard(chat: chats[intex],),),
    );
  }
}
