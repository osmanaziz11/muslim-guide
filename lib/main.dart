// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

// App Packages

import 'package:app/pages/Application.dart';
import 'package:app/pages/Login/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Flutter Packages
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 2, 2, 2)),
      home:
          (FirebaseAuth.instance.currentUser != null) ? Application() : Login(),
    );
  }
}
