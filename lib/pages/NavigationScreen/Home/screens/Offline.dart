// ignore_for_file: file_names

import 'package:app/pages/NavigationScreen/Home/screens/Offline.widgets/Quiz.dart';
import 'package:app/pages/NavigationScreen/Home/screens/Offline.widgets/Result.dart';
import 'package:app/pages/NavigationScreen/Home/screens/Offline.widgets/StartQuiz.dart';
import 'package:app/pages/NavigationScreen/Home/screens/Offline.widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Offline extends StatefulWidget {
  const Offline({super.key});

  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // header("Offline Quiz"),
            // Text(
            //   'Choose the topic you want us to assess',
            //   style: GoogleFonts.alegreyaSans(
            //       color: const Color(0xFF5A5A5A), fontSize: 14),
            // ),
            // topics(),
            StartQuiz()
            //  Result()
          ],
        ),
      ),
    );
  }
}
