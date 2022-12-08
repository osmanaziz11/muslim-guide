// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names

import 'package:app/customWidget/CircularLoader.dart';
import 'package:app/models/Users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/Register/widgets/widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _Loader = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 3, 4, 4),
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop),
          image: AssetImage(
            'assets/images/bg.jpg',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              MyWidget.getLogo(),
              SizedBox(
                height: 10,
              ),
              MyWidget.getSignIn(),
              SizedBox(
                height: 10,
              ),
              MyWidget.getDesc(),
              SizedBox(
                height: 10,
              ),
              Form(
                child: MyWidget.getForm(),
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1E1E1E)),
                  onPressed: _signup,
                  child: !_Loader
                      ? Text("Sign up",
                          style: GoogleFonts.alegreyaSans(letterSpacing: 2))
                      : CircularLoader(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MyWidget.getFooter()
            ],
          ),
        ),
      ),
    ));
  }

  void _saveUser(userCred) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      String uid = userCred.user!.uid;
      UserModel newUser = UserModel(
          uid: uid,
          email: MyWidget.email,
          name: MyWidget.name,
          password: MyWidget.password,
          profilepic: "");
      await auth.currentUser!.updateDisplayName(MyWidget.name);
      await auth.currentUser!.updatePhotoURL("assets/images/avatar1.png");
      FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set(newUser.toMap())
          .then((value) {
        // FirebaseFirestore.instance.collection("notifications").doc(uid).set();
        Navigator.pop(context);
      });
    } on FirebaseAuthException catch (ex) {
      setState(() {
        _Loader = false;
      });
      debugPrint(ex.code.toString());
    }
  }

  void _signup() async {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _Loader = true;
      });
      // call firebase auth instanse for email and password
      try {
        UserCredential userCred = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: MyWidget.email, password: MyWidget.password);

        if (userCred.user != null) {
          _saveUser(userCred);
        }
      } on FirebaseAuthException catch (ex) {
        setState(() {
          _Loader = false;
        });
        debugPrint(ex.code.toString());
      }
    }
  }
}
