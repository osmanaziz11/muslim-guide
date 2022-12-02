import 'package:app/pages/Home/screens/Offline.widgets/widgets.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          header("Result"),
          Container(
            width: double.infinity,
            height: 150,
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 33, 32, 32),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "10/15",
              style: GoogleFonts.alegreya(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(242, 255, 255, 255),
                  fontSize: 40),
            ),
          ),
        ],
      ),
    );
  }
}
