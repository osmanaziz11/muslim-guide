// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/pages/Home/screens/Learning.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// widget

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool module = false;
  InkWell box(text) {
    return InkWell(
      onTap: () {
        setState(() {
          module = true;
        });
      },
      child: Container(
        width: 50,
        height: 70,
        margin: const EdgeInsets.only(right: 14, top: 14),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 238, 237, 237),
              ),
              width: double.infinity,
              child: Icon(Icons.gamepad),
              height: 50,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Color.fromARGB(190, 255, 255, 255), fontSize: 10),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: (module
          ? Learning()
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Welcome back, Afreen!",
                  style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w900,
                      color: const Color.fromARGB(202, 255, 253, 253),
                      fontSize: 20)),
              SizedBox(
                height: 5,
              ),
              Text("How are you feeling today?",
                  style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w900,
                      color: const Color.fromARGB(142, 255, 255, 255),
                      fontSize: 13)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  box('Learning'),
                  box('Ofline'),
                  box('Online'),
                  box('Comp')
                ],
              ),
              SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: 270,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 238, 237, 237),
                        ),
                        width: double.infinity,
                        height: 130,
                      );
                    },
                  ),
                ),
              )
            ])),
    );
  }
}
