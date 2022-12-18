import 'package:app/customWidget/Appbar.dart';
import 'package:app/customWidget/MainHeading.dart';
import 'package:app/navigation.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Learning/widgets/Topic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
  InkWell ageGroups(text) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ChooseTopic(category: text.toString().toLowerCase()),
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            child: const Icon(Icons.timelapse),
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
            width: double.infinity,
            alignment: AlignmentDirectional.center,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ageGroups('Child'),
                ageGroups('Young'),
                ageGroups('Adult'),
                ageGroups('Old'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
