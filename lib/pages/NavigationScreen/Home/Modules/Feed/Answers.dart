import 'package:app/customWidget/Appbar.dart';
import 'package:app/customWidget/BadgeIcon.dart';
import 'package:app/customWidget/MainHeading.dart';
import 'package:app/models/AnswersModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class Answers extends StatefulWidget {
  late String questionId;
  Answers({super.key, required this.questionId});

  @override
  State<Answers> createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
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
                MainHeading("Authentic Answers"),
                Container(
                  width: double.infinity,
                  height: 520,
                  margin: const EdgeInsets.only(top: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('askAnswers')
                          .where("questionId", isEqualTo: widget.questionId)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.hasData) {
                            QuerySnapshot dataSnapshot =
                                snapshot.data as QuerySnapshot;
                            if (dataSnapshot.docChanges.length.toString() !=
                                '0') {
                              return ListView.builder(
                                itemCount: dataSnapshot.docChanges.length,
                                itemBuilder: (context, index) {
                                  AnswersModel data = AnswersModel.fromMap(
                                      dataSnapshot.docs[index].data()
                                          as Map<String, dynamic>);
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    padding: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff201E1E),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              const Color.fromARGB(255, 0, 0, 0)
                                                  .withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                          offset: const Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(children: [
                                      ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage:
                                              AssetImage(data.answerByPic!),
                                        ),
                                        title: Text(
                                          data.answerByName!,
                                          style: GoogleFonts.alegreyaSans(
                                              color: const Color.fromARGB(
                                                  255, 211, 208, 208),
                                              fontSize: 20),
                                        ),
                                        subtitle: Text(
                                          data.answerByEmail!,
                                          style: GoogleFonts.alegreyaSans(
                                              color: const Color(0xFF5A5A5A),
                                              fontSize: 16),
                                        ),
                                      ),
                                      Container(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          data.answer!,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ]),
                                  );
                                },
                              );
                            } else {
                              return const Center(
                                child: Text(
                                  "No Answers to be given.",
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          }
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
