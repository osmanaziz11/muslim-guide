// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'package:app/pages/Login/widgets/widgets.dart';
import 'package:app/pages/Register/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
              widget.getForm(),
              SizedBox(
                height: 20,
              ),
              widget.getButton(),
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
}
