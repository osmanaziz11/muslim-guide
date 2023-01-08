import 'package:app/customWidget/Appbar.dart';
import 'package:app/customWidget/CircularLoader.dart';
import 'package:app/models/Notification.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Feed/Answers.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Online/screens/QuizRoom.dart';
import 'package:app/pages/NavigationScreen/Notification/screens/notRoom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ci.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        const Iconify(
          Ci.menu_alt_05,
          color: Colors.white,
          size: 50,
        ),
      ),
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('notifications')
                .where("rID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;
                  if (dataSnapshot.docChanges.length.toString() != '0') {
                    return Container(
                      height: 470,
                      child: ListView.builder(
                        itemCount: dataSnapshot.docChanges.length,
                        itemBuilder: (context, index) {
                          NotificationModel noti = NotificationModel.fromMap(
                              dataSnapshot.docs[index].data()
                                  as Map<String, dynamic>);
                          return ListTile(
                            onTap: () async {
                              if (noti.type == 'invite') {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return notRoom(roomID: noti.roomID!);
                                  },
                                ));
                              }
                            },
                            leading: const Icon(
                              Icons.notifications_on,
                              color: Colors.white,
                              size: 30,
                            ),
                            title: Text(
                              noti.senderName!,
                              style: GoogleFonts.alegreyaSans(
                                  color:
                                      const Color.fromARGB(255, 211, 208, 208),
                                  fontSize: 20),
                            ),
                            subtitle: Text(
                              (noti.type == "answer")
                                  ? "${noti.senderEmail} Answer your question"
                                  : "${noti.senderEmail} Invite for a quiz",
                              style: GoogleFonts.alegreyaSans(
                                  color: const Color(0xFF5A5A5A), fontSize: 16),
                            ),
                            // trailing: InkWell(
                            //   onTap: (){

                            //   },
                            //   child: Container(
                            //     width: 28,
                            //     height: 28,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(30),
                            //         color: Colors.red),
                            //     child: const Icon(
                            //       Icons.close,
                            //       color: Color.fromARGB(181, 255, 255, 255),
                            //     ),
                            //   ),
                            // ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text(
                        "No notification found.",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: CircularLoader(),
                  );
                }
              } else {
                return Center(
                  child: CircularLoader(),
                );
              }
            }),
      ),
    );
  }
}
