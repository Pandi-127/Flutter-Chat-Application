import 'package:chat_app/Pages/CallsPage.dart';
import 'package:chat_app/Pages/CameraPage.dart';
import 'package:chat_app/Pages/ChatPage.dart';
import 'package:chat_app/Pages/StatusPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Myapp extends StatefulWidget  {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp>  with SingleTickerProviderStateMixin{
   late TabController _mycontroler;
   Color maincolor =Color(0xFF049347);
   Color indicatorcolor =Color(0xFF0F8733);
  @override
  void initState(){
    super.initState();
      _mycontroler = TabController(length: 4, initialIndex: 1 ,vsync:this );
  }
   @override
   void dispose() {
     _mycontroler.dispose();
     super.dispose();
   }


   Widget build(BuildContext context)  {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:maincolor,
        title:Text("chat-chat"),
        titleTextStyle: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 18),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.white,)),
          Theme(
            data: Theme.of(context).copyWith(
              popupMenuTheme: PopupMenuThemeData(
                iconColor: Colors.white
              )
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
        bottom:PreferredSize(
          preferredSize: const Size(20, 30),

          child: Container(
            color:Color(0xFFFDFDFD),
            child: TabBar(
              indicatorColor: indicatorcolor,
              controller:_mycontroler ,
                tabs:[
                  Tab(icon: Icon(Icons.camera_alt_outlined),),
                  Tab(text: "Chats",),
                  Tab(text:"Status"),
                  Tab(text:"Calls",)
                ]
               ),
              ),
             ),
            ),
        body:TabBarView(
            controller: _mycontroler,
            children:[
              CameraPage(),
              Chatpage(),
              StatusPage(),
              CallsPage(),
            ]
           ),
          ),
         );
        }
       }