// import 'package:app/pages/Home/Home.dart';
import 'package:app/pages/NavigationScreen/Home/Home.dart';
import 'package:app/pages/NavigationScreen/Home/screens/Learning.dart';
import 'package:app/pages/NavigationScreen/Home/screens/Offline.dart';
import 'package:app/pages/NavigationScreen/Notification/Notification.dart';
import 'package:app/pages/NavigationScreen/Profile/Profile.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];
  void _navigate(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: const Icon(
          Icons.menu_rounded,
          size: 28,
          color: Color.fromARGB(190, 255, 255, 255),
        ),
        title: Container(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            "assets/images/Logo.png",
            width: 50,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 185, 183, 183),
              radius: 13, //radius is 35.
              //AssetImage loads image URL.
            ),
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              label: "Home",
              backgroundColor: Color.fromARGB(169, 6, 6, 6),
              icon: Icon(
                Icons.home,
              )),
          BottomNavigationBarItem(
            label: "Notifications",
            icon: Icon(Icons.notifications),
            backgroundColor: Color.fromARGB(169, 6, 6, 6),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.dashboard),
            backgroundColor: Color.fromARGB(169, 6, 6, 6),
          ),
          BottomNavigationBarItem(
            label: "Sign out",
            icon: Icon(Icons.exit_to_app),
            backgroundColor: Color.fromARGB(169, 6, 6, 6),
          ),
        ],
        iconSize: 20,
        unselectedFontSize: 11,
        selectedFontSize: 11,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        unselectedItemColor: const Color.fromARGB(142, 255, 255, 255),
        fixedColor: const Color.fromARGB(255, 247, 244, 243),
        onTap: _navigate,
      ),
    );
  }
}
