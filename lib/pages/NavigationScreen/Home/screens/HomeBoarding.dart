import 'package:app/models/Users.dart';
import 'package:app/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBoarding extends StatefulWidget {
  const HomeBoarding({super.key});

  @override
  State<HomeBoarding> createState() => _HomeBoardingState();
}

class _HomeBoardingState extends State<HomeBoarding> {
  InkWell box(index, text) {
    return InkWell(
      onTap: () {
        switch (index) {
          case 1:
            Navigation.appNavigation.currentState!.pushNamed('/Learning');
            break;
          case 2:
            Navigation.appNavigation.currentState!.pushNamed('/Offline');
            break;
          case 3:
            Navigation.appNavigation.currentState!.pushNamed('/Online');
            break;
          case 4:
            Navigation.appNavigation.currentState!.pushNamed('/Compitition');
            break;

          default:
            Navigation.appNavigation.currentState!.pushNamed('/');
        }
      },
      child: Container(
        width: 65,
        height: 90,
        margin: const EdgeInsets.only(top: 14),
        alignment: AlignmentDirectional.center,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              width: double.infinity,
              child: Icon(Icons.gamepad),
              height: 60,
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
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
              "Welcome back, ${FirebaseAuth.instance.currentUser!.displayName}!",
              style: GoogleFonts.alegreya(
                  // fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(202, 255, 253, 253),
                  fontSize: 30)),
          SizedBox(
            height: 5,
          ),
          Text("How are you feeling today?",
              style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(142, 255, 255, 255),
                  fontSize: 15)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              box(1, "Learning"),
              box(2, "Offline"),
              box(3, "Online"),
              box(4, "Comp")
            ],
          ),
          SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 400,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/a.webp")),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 238, 237, 237),
                    ),
                    width: double.infinity,
                    height: 180,
                  );
                },
              ),
            ),
          )
        ]));
  }
}
