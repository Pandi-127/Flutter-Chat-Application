 import 'package:flutter/cupertino.dart';

class ProfileDataModel{
  String Name;
  IconData iconModel;
  bool isGroup;
  String lastMessage;
  String time;
  ProfileDataModel({  required this.Name, required this.iconModel, required this.isGroup,required this.lastMessage,required this.time});
}