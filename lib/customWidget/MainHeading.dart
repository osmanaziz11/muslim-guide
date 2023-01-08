import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container MainHeading(text) {
  return Container(
    margin: const EdgeInsets.only(top: 15, bottom: 5),
    child: Column(children: [
      Text(
        text,
        style: GoogleFonts.alegreya(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
      ),
    ]),
  );
}
