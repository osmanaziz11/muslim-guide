import 'package:app/navigation.dart';
import 'package:app/pages/NavigationScreen/Home/screens/Learning.widgets/Topic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Learning extends StatefulWidget {
  const Learning({super.key});

  @override
  State<Learning> createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  bool topicModule = false;
  InkWell ageGroups(text) {
    return InkWell(
      onTap: () {
        Navigation.appNavigation.currentState!.pushNamed("/Learning/ageGroup");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            child: Icon(Icons.timelapse),
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
          ),
          Text(
            text,
            style: GoogleFonts.comfortaa(
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(202, 255, 253, 253),
                fontSize: 15),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (topicModule
        ? const ChooseTopic()
        : Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Choose Your Age Group",
                style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w900,
                    color: const Color.fromARGB(202, 255, 253, 253),
                    fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                alignment: AlignmentDirectional.center,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ageGroups('10 - 15'),
                    ageGroups('15 - 20'),
                    ageGroups('20 - 30'),
                    ageGroups('30 - 40'),
                  ],
                ),
              ),
            ],
          ));
  }
}
