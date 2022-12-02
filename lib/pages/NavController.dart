// import 'package:app/pages/Home/Home.dart';
import 'package:app/pages/Home/screens/Offline.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
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
      body: Offline(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 6, 6, 6),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.home,
              )),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.dashboard)),
        ],
        currentIndex: 0,
        unselectedItemColor: const Color.fromARGB(142, 255, 255, 255),
        fixedColor: const Color.fromARGB(255, 247, 244, 243),
        onTap: null,
      ),
    );
    ;
  }
}
