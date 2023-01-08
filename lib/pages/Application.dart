// import 'package:app/pages/Home/Home.dart';
import 'package:app/customWidget/BadgeIcon.dart';
import 'package:app/models/Users.dart';
import 'package:app/pages/Login/Login.dart';
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

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const NotificationScreen(),
    const ProfileScreen()
  ];
  int _currentIndex = 0;
  FirebaseAuth auth = FirebaseAuth.instance;
  void _navigate(value) {
    if (value == 3) {
      _signOut();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ));
    } else {
      setState(() {
        _currentIndex = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          items: [
            const BottomNavigationBarItem(
                label: "Home",
                backgroundColor: Color.fromARGB(169, 6, 6, 6),
                icon: Icon(
                  Icons.home,
                )),
            BottomNavigationBarItem(
                label: "Notifications",
                icon: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("notifications")
                      .where("rID",
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (_, snapshot) => BadgeIcon(
                    icon: const Icon(Icons.notifications, size: 25),
                    badgeCount: (snapshot.hasData)
                        ? snapshot.data!.docChanges.length
                        : 0,
                  ),
                )),
            const BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.dashboard),
              backgroundColor: Color.fromARGB(169, 6, 6, 6),
            ),
            const BottomNavigationBarItem(
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
      ),
    );
  }
}
