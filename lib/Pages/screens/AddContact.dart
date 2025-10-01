import 'package:chat_app/CustomeUi/CustomeCard.dart';
import 'package:chat_app/Datas/ProfileDataModel.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

List<ProfileDataModel> availableContacts = [
  ProfileDataModel(
      Name: "+915165462358",
      iconModel: Icons.person,
      isGroup: false,
      lastMessage: "hey! there iam in WhatApp",
      time: "12:3",
      isnewconduct: true,
      Status: "hey! there iam in WhatApp"),
  ProfileDataModel(
      Name: "+915651565465",
      iconModel: Icons.person,
      isGroup: false,
      lastMessage: "hey! there iam in WhatApp",
      time: "12:3",
      Status: "hey! there iam in WhatApp",
      isnewconduct: false),
  ProfileDataModel(
      Name: "+816546546465",
      iconModel: Icons.person,
      isGroup: false,
      lastMessage: "hey! there iam in WhatApp",
      time: "12:3",
      Status: "hey! there iam in WhatApp",
      isnewconduct: true),
  ProfileDataModel(
      Name: "+Ramesh",
      iconModel: Icons.person,
      isGroup: false,
      lastMessage: "hey! there iam in WhatApp",
      time: "12:3",
      Status: "hey! there iam in WhatApp",
      isnewconduct: true),
  ProfileDataModel(
      Name: "kumar",
      iconModel: Icons.person,
      isGroup: false,
      lastMessage: "hey! there iam in WhatApp",
      time: "12:3",
      Status: "hey! there iam in WhatApp",
      isnewconduct: true),
  ProfileDataModel(
      Name: "shame",
      iconModel: Icons.person,
      isGroup: false,
      lastMessage: "hey! there iam in WhatApp",
      time: "12:3",
      Status: "hey! there iam in WhatApp",
      isnewconduct: true),
  ProfileDataModel(
      Name: "+915316545465",
      iconModel: Icons.person,
      isGroup: false,
      lastMessage: "hey! there iam in WhatApp",
      time: "12:3",
      Status: "hey! there iam in WhatApp",
      isnewconduct: true),
  ProfileDataModel(
      Name: "rook",
      iconModel: Icons.person,
      isGroup: false,
      lastMessage: "hey! there iam in WhatApp",
      time: "12:3",
      Status: "hey! there iam in WhatApp",
      isnewconduct: true),
  ProfileDataModel(
      Name: "MaxTenison",
      iconModel: Icons.person,
      isGroup: false,
      lastMessage: "hey! there iam in WhatApp",
      time: "12:3",
      Status: "hey! there iam in WhatApp",
      isnewconduct: true),
  ProfileDataModel(
      Name: "jone",
      iconModel: Icons.person,
      isGroup: false,
      lastMessage: "hey! there iam in WhatApp",
      time: "12:3",
      Status: "hey! there iam in WhatApp",
      isnewconduct: true),
];

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    final existingContacts =
    availableContacts.where((c) => !c.isnewconduct).toList();
    final newContacts =
    availableContacts.where((c) => c.isnewconduct).toList();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add Contact",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Text("${availableContacts.length} contacts",
                style: TextStyle(fontSize: 13)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("Add Contact")),
                PopupMenuItem(child: Text("Refresh")),
                PopupMenuItem(child: Text("Invite")),
                PopupMenuItem(child: Text("Help")),
              ];
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // New Group
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.group_add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.green,
              ),
              title: Text("New Group",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
          ),

          // New Contact
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.person_add_alt_rounded,
                  color: Colors.white,
                ),
                backgroundColor: Colors.green,
              ),
              title: Text("New Contact",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.qr_code)),
            ),
          ),

          // Existing Contacts Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Contacts on Chat Chat",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ...existingContacts.map((c) => CustomeProfileCard(chat: c)),

          // New Contacts Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Invite to Chat Chat",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ...newContacts.map(
                (c) => ListTile(
              leading: CircleAvatar(child: Icon(c.iconModel)),
              title: Text(c.Name),
              subtitle: Text(c.Status ?? ""),
              trailing: TextButton(
                onPressed: () {
                  print("Invite sent to ${c.Name}");
                },
                child: Text(
                  "Invite",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
