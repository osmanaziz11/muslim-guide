import 'package:app/customWidget/MainHeading.dart';
import 'package:app/models/Notification.dart';
import 'package:app/models/Users.dart';
import 'package:app/navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class CreateRoom extends StatefulWidget {
  const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  int numberOfParticipants = 0;
  bool inviteStatus = false;
  var roomID = const Uuid().v1();
  var searchUser = '';
  void participants(value) {
    setState(() {
      searchUser = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 500,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainHeading("Room id: ${roomID.substring(0, 7)}"),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Invite Participant',
                style: GoogleFonts.alegreyaSans(
                    color: const Color(0xFF5A5A5A), fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  onChanged: participants,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color(0xFFBEC2C2),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Color(0xFFBEC2C2),
                    ),
                    hintText: "Email Address",
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFFBEC2C2)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFFBEC2C2)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 380,
                child: Column(
                  children: [
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .where("name", isEqualTo: searchUser)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            if (snapshot.hasData) {
                              QuerySnapshot dataSnapshot =
                                  snapshot.data as QuerySnapshot;
                              return Container(
                                height: 370,
                                child: ListView.builder(
                                  itemCount: dataSnapshot.docChanges.length,
                                  itemBuilder: (context, index) {
                                    UserModel user = UserModel.fromMap(
                                        dataSnapshot.docs[index].data()
                                            as Map<String, dynamic>);
                                    return ListTile(
                                      onTap: () async {},
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "${(user.profilepic == '') ? 'assets/images/avatar1.png' : user.profilepic}"),
                                      ),
                                      title: Text(
                                        user.name as String,
                                        style: GoogleFonts.alegreyaSans(
                                            color: const Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: 20),
                                      ),
                                      subtitle: Text(
                                        user.email as String,
                                        style: GoogleFonts.alegreyaSans(
                                            color: const Color(0xFF5A5A5A),
                                            fontSize: 16),
                                      ),
                                      trailing: Container(
                                        height: 40,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: (inviteStatus)
                                                    ? Color.fromARGB(
                                                        255, 24, 221, 18)
                                                    : Colors.red),
                                            onPressed: () async {
                                              if (!inviteStatus) {
                                                NotificationModel noti =
                                                    NotificationModel(
                                                        rID: user.uid as String,
                                                        senderName: FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .displayName,
                                                        senderEmail:
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .email,
                                                        roomID: roomID
                                                            .substring(0, 7),
                                                        type: "invite",
                                                        sendon: DateTime.now());
                                                FirebaseFirestore.instance
                                                    .collection("notifications")
                                                    .doc()
                                                    .set(noti.toMap())
                                                    .then((value) {
                                                  print("done");
                                                  setState(() {
                                                    inviteStatus =
                                                        !inviteStatus;
                                                  });
                                                });
                                              } else {
                                                setState(() {
                                                  inviteStatus = !inviteStatus;
                                                });
                                              }
                                            },
                                            child: Text(
                                                (inviteStatus)
                                                    ? 'Invited'
                                                    : 'Invite',
                                                style: GoogleFonts.alegreyaSans(
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 2))),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return const Text(
                                "No record found.",
                                style: TextStyle(color: Colors.white),
                              );
                            }
                          } else {
                            return const Text(
                              "An error occured.",
                            );
                          }
                        }),
                  ],
                ),
              ),
              if (inviteStatus)
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        Navigation.appNavigation.currentState!
                            .pushNamed("/Online/createroom/quizroom");
                      },
                      child: Text("Goto Room",
                          style: GoogleFonts.alegreyaSans(letterSpacing: 2))),
                )
            ],
          ),
        ));
  }
}
