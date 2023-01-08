// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget {
  static String name = '';
  static String email = '';
  static String password = '';

  static Center getLogo() {
    return Center(
      child: Image.asset(
        "assets/images/Logo.png",
        width: 130,
      ),
    );
  }

  static Text getSignIn() {
    return Text("Sign Up",
        textAlign: TextAlign.center,
        style: GoogleFonts.alegreya(color: Colors.white, fontSize: 20));
  }

  static Container getDesc() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text("Sign Up now to start learning.",
          textAlign: TextAlign.center,
          style: GoogleFonts.alegreyaSans(color: Colors.white54, fontSize: 17)),
    );
  }

  static Container getForm() {
    final nameRegExp = RegExp(r'^[a-zA-Z ]{3,10}$');
    final emailRegExp = RegExp(
        r'^[a-zA-Z0-9.]+@(gmail.com|yahoo.com|bahria.edu.pk|outlook.com|hotmail.com)$');
    final passwordRegExp = RegExp(r'^[a-zA-Z0-9@#$.!^%*]{5,10}$');
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            TextFormField(
              onSaved: (value) {
                name = value.toString();
              },
              key: Key("name"),
              validator: (value) {
                if (value == '') return 'Name is required';
                if (!nameRegExp.hasMatch(value.toString())) {
                  return "Inavlid Name";
                } else {
                  return null;
                }
              },
              style: TextStyle(color: Colors.white),
              cursorColor: Color(0xFFBEC2C2),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Color(0xFFBEC2C2),
                ),
                hintText: "Name",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFBEC2C2)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFBEC2C2)),
                ),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value == '') return 'Email is required';
                if (!emailRegExp.hasMatch(value.toString())) {
                  return "Inavlid Email";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                email = value.toString();
              },
              key: Key("email"),
              style: TextStyle(color: Colors.white),
              cursorColor: Color(0xFFBEC2C2),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Color(0xFFBEC2C2),
                ),
                hintText: "Email Address",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFBEC2C2)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFBEC2C2)),
                ),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value == '') return 'Password is required';
                if (!passwordRegExp.hasMatch(value.toString())) {
                  return "Invalid Password";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                password = value.toString();
              },
              key: Key("password"),
              style: TextStyle(color: Colors.white),
              cursorColor: Color(0xFFBEC2C2),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Color(0xFFBEC2C2),
                ),
                hintText: "Password",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFBEC2C2)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFBEC2C2)),
                ),
              ),
            ),
            SizedBox(
              height: 17,
            ),
          ],
        ));
  }

  static Container getFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text("Already have an account? Sign In",
          textAlign: TextAlign.center,
          style: GoogleFonts.alegreyaSans(
              color: Color.fromARGB(202, 255, 253, 253), fontSize: 13)),
    );
  }
}
