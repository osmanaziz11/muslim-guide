// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'package:app/customWidget/CircularLoader.dart';
import 'package:app/models/Users.dart';
import 'package:app/pages/Application.dart';
import 'package:app/pages/NavigationScreen/Home/Home.dart';
import 'package:app/pages/Login/widgets/widgets.dart';
import 'package:app/pages/Register/Register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 50,
              ),
              widget.getLogo(),
              SizedBox(
                height: 10,
              ),
              widget.getSignIn(),
              SizedBox(
                height: 10,
              ),
              widget.getDesc(),
              SizedBox(
                height: 10,
              ),
              Form(
                child: widget.getForm(),
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
                  onPressed: _signin,
                  child: !_Loader
                      ? Text("Sign in",
                          style: GoogleFonts.alegreyaSans(letterSpacing: 2))
                      : CircularLoader(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              widget.getSocial(),
              SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text("Doesn't have an account? Sign Up",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alegreyaSans(
                        color: Color.fromARGB(202, 255, 253, 253),
                        fontSize: 13)),
              ),
            ]),
          ),
        ),
      ),
    ));
  }

  void _signin() async {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _Loader = true;
      });
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: widget.email, password: widget.password);
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context, CupertinoPageRoute(builder: (context) => Application()));
        }
      } on FirebaseAuthException catch (ex) {
        print(ex);
      }
    }
  }
}
