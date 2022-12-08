import 'package:app/pages/NavigationScreen/Home/Modules/Offline/widgets/Countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizRoom extends StatefulWidget {
  const QuizRoom({super.key});

  @override
  State<QuizRoom> createState() => _QuizRoomState();
}

class _QuizRoomState extends State<QuizRoom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(children: [
        Text(
          'Participants',
          style: GoogleFonts.alegreyaSans(
              color: Color.fromARGB(255, 201, 199, 199), fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
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
                      decoration: BoxDecoration(),
                      width: double.infinity,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      height: 60,
                    ),
                    Text(
                      "Osman",
                      style: TextStyle(
                          color: Color.fromARGB(190, 255, 255, 255),
                          fontSize: 10),
                    )
                  ],
                ),
              ),
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
                      decoration: BoxDecoration(),
                      width: double.infinity,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      height: 60,
                    ),
                    Text(
                      "Osman",
                      style: TextStyle(
                          color: Color.fromARGB(190, 255, 255, 255),
                          fontSize: 10),
                    )
                  ],
                ),
              ),
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
                      decoration: BoxDecoration(),
                      width: double.infinity,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      height: 60,
                    ),
                    Text(
                      "Osman",
                      style: TextStyle(
                          color: Color.fromARGB(190, 255, 255, 255),
                          fontSize: 10),
                    )
                  ],
                ),
              ),
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
                      decoration: BoxDecoration(),
                      width: double.infinity,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      height: 60,
                    ),
                    Text(
                      "Osman",
                      style: TextStyle(
                          color: Color.fromARGB(190, 255, 255, 255),
                          fontSize: 10),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 400,
          child: countdown(changeStatus: null),
        ),
      ]),
    );
  }
}
