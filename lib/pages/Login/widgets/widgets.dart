import 'package:app/customWidget/CircularLoader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/bytesize.dart';
import 'package:iconify_flutter/icons/simple_icons.dart';

// ignore: camel_case_types
class widget {
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
    return Text("Sign In",
        textAlign: TextAlign.center,
        style: GoogleFonts.alegreya(color: Colors.white, fontSize: 20));
  }

  static Container getDesc() {
    return Container(
      alignment: AlignmentDirectional.center,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text("Sign in now to  access and start learning.",
          textAlign: TextAlign.start,
          style: GoogleFonts.alegreyaSans(color: Colors.white54, fontSize: 17)),
    );
  }

  static Container getForm() {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                final emailRegExp = RegExp(
                    r'^[a-zA-Z0-9.]+@(gmail.com|yahoo.com|bahria.edu.pk|outlook.com|hotmail.com)$');

                if (value == '') return 'Email is required';
                if (!emailRegExp.hasMatch(value.toString())) {
                  return "Invalid Email";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                email = value.toString();
              },
              key: const Key("email"),
              style: const TextStyle(color: Colors.white),
              cursorColor: const Color(0xFFBEC2C2),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
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
                if (value == '') {
                  return 'Password is required';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                password = value.toString();
              },
              key: const Key("password"),
              style: const TextStyle(color: Colors.white),
              cursorColor: const Color(0xFFBEC2C2),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
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
            const SizedBox(
              height: 17,
            ),
            Text("Forget Password?",
                textAlign: TextAlign.center,
                style: GoogleFonts.alegreyaSans(
                    color: const Color(0xFFBEC2C2), fontSize: 12))
          ],
        ));
  }

  static Container getButton() {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        child: Text("LOGIN", style: GoogleFonts.alegreyaSans(letterSpacing: 2)),
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color(0xff1E1E1E)),
        onPressed: () {
          print("Click");
        },
      ),
    );
  }

  static Row getSocial() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(8),
          child: const Iconify(
            AntDesign.google_outlined,
            color: Colors.white,
          ),
          decoration: const BoxDecoration(
              color: Color(0xff010101), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(8),
          child: const Iconify(
            SimpleIcons.meta,
            color: Color(0xff0080FA),
          ),
          decoration: const BoxDecoration(
              color: Color(0xff010101), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(7),
          child: const Iconify(
            Bytesize.github,
            color: Colors.white,
            size: 13,
          ),
          decoration: const BoxDecoration(
              color: Color(0xff010101), shape: BoxShape.circle),
        )
      ],
    );
  }

  static Align getFooter() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 220,
        child: TextButton(
          onPressed: () {},
          child: Text("Doesn't have an account? Sign Up",
              textAlign: TextAlign.center,
              style: GoogleFonts.alegreyaSans(
                  color: const Color.fromARGB(202, 255, 253, 253),
                  fontSize: 13)),
        ),
      ),
    );
  }
}
