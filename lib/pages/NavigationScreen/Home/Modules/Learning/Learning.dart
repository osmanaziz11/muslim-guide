import 'package:app/customWidget/Appbar.dart';
import 'package:app/customWidget/MainHeading.dart';

import 'package:app/pages/NavigationScreen/Home/Modules/Learning/widgets/Topic.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class LearningBoarding extends StatefulWidget {
  const LearningBoarding({super.key});

  @override
  State<LearningBoarding> createState() => _LearningBoardingState();
}

class _LearningBoardingState extends State<LearningBoarding> {
  bool topicModule = false;
  InkWell ageGroups(text, sub) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ChooseTopic(category: text.toString().toLowerCase()),
            ));
      },
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          child: Icon(Icons.timelapse),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
        ),
        title: Text(
          text,
          style: GoogleFonts.comfortaa(
              fontWeight: FontWeight.w900,
              color: const Color.fromARGB(202, 255, 253, 253),
              fontSize: 15),
        ),
        subtitle: Text(
          sub,
          style: GoogleFonts.comfortaa(
            fontWeight: FontWeight.w900,
            color: const Color.fromARGB(202, 255, 253, 253),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(const Iconify(
        MaterialSymbols.arrow_back_ios_rounded,
        color: Colors.white,
        size: 44,
      )),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          MainHeading("Choose Age Group"),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            alignment: AlignmentDirectional.center,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ageGroups('Child', "Age between 10 to 15"),
                ageGroups('Young', "Age between 15 to 20"),
                ageGroups('Adult', "Age between 20 to 40"),
                ageGroups('Old', "Age between 40 to 40+"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
