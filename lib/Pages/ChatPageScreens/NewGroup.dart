import 'package:chat_app/Datas/ProfileDataModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
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
      isnewconduct: false),
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
      isnewconduct: false),
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

class _CreateGroupState extends State<CreateGroup> {
  List<ProfileDataModel> selectedContacts = [];

  @override
  Widget build(BuildContext context) {
    final existingContacts = availableContacts.where((c) => !c.isnewconduct).toList();
    final newContacts = availableContacts.where((c) => c.isnewconduct).toList();

    List<Widget> selectedAvatars = [
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.green,
              radius: 20,
              child: Icon(Icons.person_add_alt_rounded,color: Colors.white
                ,),
            ),
          ),

    ];
    if(selectedContacts.isNotEmpty){
    selectedAvatars.removeAt(0);
    }
    selectedAvatars.addAll(
      selectedContacts.map((contact) => InkWell(
        onTap: (){setState(() {
          selectedContacts.remove(contact);
        });},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Stack(
            children: [ CircleAvatar(
              backgroundColor: Colors.green,
              radius: 20,
              child:Icon(contact.iconModel,color: Colors.white,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 22),
              child: Icon(Icons.cancel,color: Color(0xFF635C5C),),
            )],
          ),
        ),
      )),
    );

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add Members",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              "${selectedContacts.length} out of ${availableContacts.length} Selected",  // Fixed and made dynamic
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement search functionality
              print("Search pressed");
            },
            icon: const Icon(Icons.search),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 80),  // Fixed MediaQuery usage
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: selectedAvatars,  // Use the built list of avatars
              ),
            ),
          ),
        ),
      ),

      body: ListView(
        children: [
          // Existing Contacts Section
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Contacts on Chat Chat",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

          ...existingContacts.map(
                  (c){ return InkWell(
                    onTap: (){setState(() {
                      if(selectedContacts.contains(c)){
                        selectedContacts.remove(c);
                      }else{
                        selectedContacts.add(c);
                      }
                    });},

                    child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.green,
                                    child: Icon(c.iconModel,color: Colors.white,)),
                                title: Text(
                                  c.Name,
                                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(
                                  c.Status,
                                  style: const TextStyle(fontSize: 13),
                                ),
                                trailing: Checkbox(
                                  shape:CircleBorder() ,
                                  value: selectedContacts.contains(c),
                                  onChanged: (bool? newValue) {
                                    setState(() {
                    if (newValue == true) {
                      if (!selectedContacts.contains(c)) {
                        selectedContacts.add(c);
                      }
                    } else {
                      selectedContacts.remove(c);
                    }
                                    });
                                  },
                                  activeColor: Colors.green,
                                  checkColor: Colors.white,
                                ),
                              ),
                  );}),

          // New Contacts Section
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Invite to Chat Chat",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
          ),
          ...newContacts.map(
                (c) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                    child: Icon(c.iconModel,color: Colors.white,)),
                                title: Text(c.Name),
                               // subtitle: Text(c.Status ?? ""),
                                trailing: TextButton(
                  onPressed: () {
                    print("Invite sent to ${c.Name}");

                    // TODO: Implement actual invite logic
                  },
                  child: const Text(
                    "Invite",
                    style: TextStyle(color: Colors.green),
                  ),
                                ),
                              ),
                ),
          ),
        ],
      ),
     floatingActionButton: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
       child: FloatingActionButton(
         shape: CircleBorder(),
         onPressed: (){},
         child: Icon(Icons.add,color: Colors.white,),
         backgroundColor: Color(0xFF7CD187),
       ),
     ),
     //
    );
  }
}