// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/pages/NavigationScreen/Home/Modules/Offline/OfflineBoarding.dart';
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
