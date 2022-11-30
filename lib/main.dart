// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

// App Packages
import 'package:app/pages/Home.dart';
import 'package:app/pages/Register/main.dart';
import 'package:app/pages/Login/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
// Flutter Packages
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF100f10)),
      home: (FirebaseAuth.instance.currentUser != null) ? Home() : Login(),
    );
  }
}
