import 'package:app/customWidget/Appbar.dart';
import 'package:app/customWidget/CircularLoader.dart';
import 'package:app/customWidget/MainHeading.dart';
import 'package:app/models/AskModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:uuid/uuid.dart';

class Ask extends StatefulWidget {
  const Ask({super.key});

  @override
  State<Ask> createState() => _AskState();
}

class _AskState extends State<Ask> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String question = '';
  var questionId = Uuid().v1();
  bool _Loader = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(const Iconify(
        MaterialSymbols.arrow_back_ios_rounded,
        color: Colors.white,
        size: 44,
      )),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainHeading("Ask Anything"),
                Container(
                  width: double.infinity,
                  height: 500,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          TextFormField(
                            onSaved: (value) {
                              title = value.toString();
                            },
                            validator: (value) {
                              if (value == '') return 'Title is required';
                              return null;
                            },
                            style: const TextStyle(color: Colors.white),
                            cursorColor: const Color(0xFFBEC2C2),
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                color: Color(0xFFBEC2C2),
                              ),
                              hintText: "Title",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFFBEC2C2)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFFBEC2C2)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            onSaved: (value) {
                              question = value.toString();
                            },
                            validator: (value) {
                              if (value == '') return 'Enter question';
                              return null;
                            },
                            minLines:
                                6, // any number you need (It works as the rows for the textarea)
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: const TextStyle(color: Colors.white),
                            cursorColor: const Color(0xFFBEC2C2),
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                color: Color(0xFFBEC2C2),
                              ),
                              hintText: "Question details",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFFBEC2C2)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFFBEC2C2)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 40,
                      width: 200,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 255, 255, 255)),
                        onPressed: _askQuestion,
                        child: !_Loader
                            ? Text("Post",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2, color: Colors.black))
                            : CircularLoader(),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _askQuestion() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _Loader = true;
      });
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        String uid = auth.currentUser!.uid;
        AskModel myQuestion = AskModel(
            questionId: questionId,
            askById: uid,
            askByEmail: auth.currentUser!.email,
            askByName: auth.currentUser!.displayName,
            askByPic: auth.currentUser!.photoURL,
            title: title,
            question: question);
        FirebaseFirestore.instance
            .collection("askQuestion")
            .doc()
            .set(myQuestion.toMap())
            .then((value) {
          Navigator.pop(context);
        });
      } on FirebaseAuthException catch (ex) {
        setState(() {
          _Loader = false;
        });
        debugPrint(ex.code.toString());
      }
    }
  }
}
