import 'package:app/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class OnlineBoarding extends StatelessWidget {
  const OnlineBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1E1E1E)),
                onPressed: () {
                  Navigation.appNavigation.currentState!
                      .pushNamed("/Online/createroom");
                },
                child: Text("Create Room",
                    style: GoogleFonts.alegreyaSans(letterSpacing: 2))),
          ),
          Spacer(),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1E1E1E)),
                onPressed: () {
                  Navigation.appNavigation.currentState!
                      .pushNamed("/Online/join");
                },
                child: Text("Join Room",
                    style: GoogleFonts.alegreyaSans(letterSpacing: 2))),
          ),
        ],
      )),
    );
  }
}
