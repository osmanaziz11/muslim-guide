import 'package:app/customWidget/Appbar.dart';
import 'package:app/models/Users.dart';
import 'package:app/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/arcticons.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:iconify_flutter/icons/eos_icons.dart';
import 'package:iconify_flutter/icons/fa_solid.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class HomeBoarding extends StatefulWidget {
  const HomeBoarding({super.key});

  @override
  State<HomeBoarding> createState() => _HomeBoardingState();
}

class _HomeBoardingState extends State<HomeBoarding> {
  InkWell box(index, text, icon) {
    return InkWell(
      onTap: () {
        switch (index) {
          case 1:
            Navigation.appNavigation.currentState!.pushNamed('/learning');
            break;
          case 2:
            Navigation.appNavigation.currentState!.pushNamed('/Offline');
            break;
          case 3:
            Navigation.appNavigation.currentState!.pushNamed('/Online');
            break;
          case 4:
            Navigation.appNavigation.currentState!.pushNamed('/comp');
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
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: double.infinity,
              child: icon,
              height: 60,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Color.fromARGB(190, 255, 255, 255), fontSize: 10),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        const Iconify(
          Ci.menu_alt_05,
          color: Colors.white,
          size: 50,
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
                "Welcome back, ${FirebaseAuth.instance.currentUser!.displayName!.split(' ')[0]}!",
                style: GoogleFonts.alegreya(
                    // fontWeight: FontWeight.w900,
                    color: const Color.fromARGB(202, 255, 253, 253),
                    fontSize: 30)),
            const SizedBox(
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
                box(
                    1,
                    "Learning",
                    const Iconify(
                      FaSolid.quran,
                      size: 200,
                    )),
                box(
                    2,
                    "Offline",
                    const Iconify(
                      Arcticons.quran_alt,
                      size: 200,
                    )),
                box(
                    3,
                    "Online",
                    const Iconify(
                      Ion.ios_people,
                      size: 200,
                    )),
                box(
                    4,
                    "Comp",
                    const Iconify(
                      Mdi.hexagon_multiple,
                      size: 200,
                    ))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                height: 440,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 195,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 200,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text("Ask a Question",
                                          style: GoogleFonts.alegreya(
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  201, 0, 0, 0),
                                              fontSize: 28)),
                                      Text("Feel free to ask any question",
                                          style: GoogleFonts.alegreya(
                                              // fontWeight: FontWeight.w900,
                                              color: const Color.fromARGB(
                                                  201, 0, 0, 0),
                                              fontSize: 15)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 150,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 32, 31, 31),
                                    ),
                                    // padding: const EdgeInsets.symmetric(
                                    //     horizontal: 30),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 32, 31, 31)),
                                        onPressed: () {
                                          Navigation.appNavigation.currentState!
                                              .pushNamed('/ask');
                                        },
                                        child: Text("Ask a question",
                                            style: GoogleFonts.alegreyaSans(
                                                color: Colors.white,
                                                letterSpacing: 2))),
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                              height: 130,
                              width: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/question.png")),
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 238, 237, 237),
                              )),
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 195,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 200,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text("Visit Question Feed",
                                          style: GoogleFonts.alegreya(
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  201, 0, 0, 0),
                                              fontSize: 20)),
                                      Text("See authentic answers",
                                          style: GoogleFonts.alegreya(
                                              // fontWeight: FontWeight.w900,
                                              color: const Color.fromARGB(
                                                  201, 0, 0, 0),
                                              fontSize: 15)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 150,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 32, 31, 31),
                                    ),
                                    // padding: const EdgeInsets.symmetric(
                                    //     horizontal: 30),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 32, 31, 31)),
                                        onPressed: () {
                                          Navigation.appNavigation.currentState!
                                              .pushNamed('/feed');
                                        },
                                        child: Text("Question Feed",
                                            style: GoogleFonts.alegreyaSans(
                                                color: Colors.white,
                                                letterSpacing: 2))),
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                              height: 130,
                              width: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/question.png")),
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 238, 237, 237),
                              )),
                        ]),
                      ),
                    ],
                  ),
                ))
          ])),
    );
  }
}
