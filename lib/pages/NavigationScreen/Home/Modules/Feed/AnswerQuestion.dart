import 'package:app/customWidget/Appbar.dart';
import 'package:app/customWidget/CircularLoader.dart';
import 'package:app/customWidget/MainHeading.dart';
import 'package:app/models/AnswersModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class AnswerQuestion extends StatefulWidget {
  late String questionID;
  AnswerQuestion({super.key, required this.questionID});

  @override
  State<AnswerQuestion> createState() => _AnswerQuestion();
}

class _AnswerQuestion extends State<AnswerQuestion> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String answer = '';

  bool _Loader = false;
  @override
  Widget build(BuildContext context) {
    print(widget.questionID);
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
                MainHeading("Answers the Question"),
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
                              answer = value.toString();
                            },
                            validator: (value) {
                              if (value == '') return 'Enter Answer';
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
                              hintText: "Detailed Answer",
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
                        onPressed: _answersQuestion,
                        child: !_Loader
                            ? Text("Answer",
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

  void _answersQuestion() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _Loader = true;
      });
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        String uid = auth.currentUser!.uid;
        AnswersModel answerBy = AnswersModel(
          questionId: widget.questionID,
          answerById: uid,
          answerByEmail: auth.currentUser!.email,
          answerByName: auth.currentUser!.displayName,
          answerByPic: auth.currentUser!.photoURL,
          answer: answer,
        );
        FirebaseFirestore.instance
            .collection("askAnswers")
            .doc()
            .set(answerBy.toMap())
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
