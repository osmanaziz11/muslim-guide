import 'package:app/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

AppBar customAppBar(Widget myIcon) {
  FirebaseAuth auth = FirebaseAuth.instance;
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    leading: InkWell(
      onTap: () => Navigation.appNavigation.currentState!.pop(),
      child: Container(padding: const EdgeInsets.all(15), child: myIcon),
    ),
    elevation: 0,
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
  );
}
