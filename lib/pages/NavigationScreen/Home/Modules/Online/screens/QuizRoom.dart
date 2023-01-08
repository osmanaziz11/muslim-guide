import 'package:app/customWidget/Appbar.dart';
import 'package:app/models/RoomModel.dart';
import 'package:app/models/Users.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Offline/widgets/Countdown.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Online/screens/Polling.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:delayed_display/delayed_display.dart';

class QuizRoom extends StatefulWidget {
  late String roomID;
  late RoomModel hostInfo;
  QuizRoom({super.key, required this.roomID});

  @override
  State<QuizRoom> createState() => _QuizRoomState();
}

class _QuizRoomState extends State<QuizRoom> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  dynamic navigate() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Polling(id: widget.roomID),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(const Iconify(
        MaterialSymbols.arrow_back_ios_rounded,
        color: Colors.white,
        size: 44,
      )),
      body: Container(
        height: 620,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(children: [
          Text(
            'Participants',
            style: GoogleFonts.alegreyaSans(
                color: const Color.fromARGB(255, 201, 199, 199), fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 350,
            height: 110,
            child: Row(
              children: [
                Container(
                  width: 65,
                  height: 90,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(),
                        width: double.infinity,
                        height: 60,
                        child: CircleAvatar(
                          backgroundImage: (_auth.currentUser!.photoURL != "0")
                              ? NetworkImage(_auth.currentUser!.photoURL!)
                                  as ImageProvider
                              : const AssetImage("assets/images/avatar1.png"),
                        ),
                      ),
                      const Text(
                        "You",
                        style: TextStyle(
                            color: Color.fromARGB(190, 255, 255, 255),
                            fontSize: 10),
                      )
                    ],
                  ),
                ),
                DelayedDisplay(
                  delay: const Duration(seconds: 5),
                  child: Container(
                    width: 65,
                    height: 90,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    alignment: AlignmentDirectional.center,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: const BoxDecoration(),
                          width: double.infinity,
                          height: 60,
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/avatar1.png"),
                          ),
                        ),
                        const Text(
                          "Osman",
                          style: TextStyle(
                              color: Color.fromARGB(190, 255, 255, 255),
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 400,
            child: countdown(changeStatus: navigate),
          ),
        ]),
      ),
    );
  }
}
