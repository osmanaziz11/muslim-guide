// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/pages/NavigationScreen/Home/Modules/Ask/Ask.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Compition/screens/Comp.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Compition/screens/cjoin.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Compition/screens/compBoardinng.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Feed/Feed.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Learning/Learning.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Offline/OfflineBoarding.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Online/OnlineBoarding.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Online/screens/CreateRoom.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Online/screens/Join.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Online/screens/QuizRoom.dart';
import 'package:app/pages/NavigationScreen/Home/screens/HomeBoarding.dart';
import 'package:flutter/material.dart';
import '../../../navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              page = HomeBoarding();
              break;
            }

          case "/Offline":
            {
              page = OfflineBoardingScreen();
              break;
            }
          case "/learning":
            {
              page = LearningBoarding();
              break;
            }
          case "/Online":
            {
              page = OnlineBoarding();
              break;
            }
          case "/Online/createroom":
            {
              page = CreateRoom();
              break;
            }
          case "/Online/join":
            {
              page = Join();
              break;
            }
          case "/comp":
            {
              page = compBoarding();
              break;
            }
          case "/comp/create":
            {
              page = Comp();
              break;
            }
          case "/comp/join":
            {
              page = cJoin();
              break;
            }

          case "/ask":
            {
              page = Ask();
              break;
            }
          case "/feed":
            {
              page = Feed();
              break;
            }

          default:
            {
              page = HomeBoarding();
            }
        }

        return MaterialPageRoute(builder: (context) => page);
      },
    );
  }
}
