// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/pages/NavigationScreen/Home/screens/Learning.dart';
import 'package:app/pages/NavigationScreen/Home/screens/Learning.widgets/Topic.dart';
import 'package:app/pages/NavigationScreen/Home/screens/Offline.dart';
import 'package:app/pages/NavigationScreen/Home/screens/Offline.widgets/StartQuiz.dart';
import 'package:app/pages/NavigationScreen/Home/screens/WelcomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeModules = [Learning(), Offline()];
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      key: Navigation.appNavigation,
      onGenerateRoute: (settings) {
        Widget page;

        switch (settings.name) {
          case "/":
            {
              page = WelcomeScreen();
              break;
            }

          case "/Learning":
            {
              page = Learning();
              break;
            }
          case "/Learning/ageGroup":
            {
              page = ChooseTopic();
              break;
            }
          case "/Offline":
            {
              page = Offline();
              break;
            }
          case "/Offline/ChooseTopic":
            {
              page = ChooseTopic();
              break;
            }
          case "/Offline/ChooseTopic/StartQuiz":
            {
              page = StartQuiz();
              break;
            }
          case "/Offline/ChooseTopic/StartQuiz/Quiz":
            {
              page = StartQuiz();
              break;
            }
          default:
            {
              page = WelcomeScreen();
            }
        }

        return MaterialPageRoute(builder: (context) => page);
      },
    );
  }
}
