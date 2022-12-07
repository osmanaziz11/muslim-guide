// import 'package:app/pages/Home/Home.dart';
import 'package:app/models/Users.dart';
import 'package:app/pages/NavigationScreen/Home/Home.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Learning/Learning.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Offline/OfflineBoarding.dart';
import 'package:app/pages/NavigationScreen/Notification/Notification.dart';
import 'package:app/pages/NavigationScreen/Profile/Profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  // final UserModel
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _screens = [
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];
  int _currentIndex = 0;
  FirebaseAuth auth = FirebaseAuth.instance;
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
          size: 32,
          color: Color.fromARGB(190, 255, 255, 255),
        ),
        title: Container(
          // padding: const EdgeInsets.all(7),
          child: Image.asset(
            "assets/images/Logo.png",
            width: 70,
          ),
        ),
        actions: [
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.only(right: 15, top: 12),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage((auth.currentUser!.photoURL) != null
                      ? (auth.currentUser!.photoURL) as String
                      : "assets/images/avatar1.png"),
                  fit: BoxFit.contain),
              shape: BoxShape.circle,
            ),
          )
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
