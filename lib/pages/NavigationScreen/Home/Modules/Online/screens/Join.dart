import 'dart:isolate';

import 'package:app/customWidget/Appbar.dart';
import 'package:app/customWidget/CircularLoader.dart';
import 'package:app/customWidget/MainHeading.dart';
import 'package:app/models/Notification.dart';
import 'package:app/models/RoomModel.dart';
import 'package:app/models/Users.dart';
import 'package:app/navigation.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Online/screens/QuizRoom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:uuid/uuid.dart';

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  bool isLoaded = false;
  void _abc(value) {
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(const Iconify(
        MaterialSymbols.arrow_back_ios_rounded,
        color: Colors.white,
        size: 44,
      )),
      body: Container(
          width: double.infinity,
          height: 600,
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MainHeading("Join Quiz Room"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    onChanged: _abc,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: const Color(0xFFBEC2C2),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                        color: Color(0xFFBEC2C2),
                      ),
                      hintText: "Enter Room Id",
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
                if (isLoaded)
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 380,
                      child: Center(
                        child: CircularLoader(),
                      )),
              ],
            ),
          )),
    );
  }
}
