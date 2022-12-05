import 'package:app/navigation.dart';
import 'package:app/pages/NavigationScreen/Home/screens/Offline.widgets/StartQuiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Map> quizTopics = [
  {
    'title': 'Pillars of Islam',
  },
  {
    'title': 'Islamic History',
  },
  {
    'title': 'Namaz',
  },
  {
    'title': 'Hadees',
  },
];
List<Map> option = [
  {
    'title': '671 AD',
  },
  {
    'title': '670 AD',
  },
  {
    'title': '570 AD',
  },
  {
    'title': '634 AD',
  },
];

Container header(text) {
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

// Offline Quiz Topics
Container topics() {
  return Container(
      width: double.infinity,
      height: 300,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
          itemCount: option.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 15.0, mainAxisSpacing: 15.0),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigation.appNavigation.currentState!
                    .pushNamed('/Offline/ChooseTopic/StartQuiz');
              },
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.question_answer,
                      size: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      quizTopics[index]['title'],
                      style:
                          GoogleFonts.alegreyaSans(fontWeight: FontWeight.bold),
                    )
                  ],
                )),
              ),
            );
          }));
}

Container options() {
  return Container(
      width: double.infinity,
      height: 300,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
          itemCount: quizTopics.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 15.0, mainAxisSpacing: 15.0),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.question_answer,
                      size: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      quizTopics[index]['title'],
                      style:
                          GoogleFonts.alegreyaSans(fontWeight: FontWeight.bold),
                    )
                  ],
                )),
              ),
            );
          }));
}
