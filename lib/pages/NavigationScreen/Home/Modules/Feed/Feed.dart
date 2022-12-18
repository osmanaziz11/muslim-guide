import 'package:app/customWidget/Appbar.dart';
import 'package:app/customWidget/BadgeIcon.dart';
import 'package:app/customWidget/MainHeading.dart';
import 'package:app/models/AskModel.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Feed/AnswerQuestion.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Feed/Answers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
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
                MainHeading("Question Feed"),
                Container(
                  width: double.infinity,
                  height: 520,
                  margin: const EdgeInsets.only(top: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('askQuestion')
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
                                  AskModel data = AskModel.fromMap(
                                      dataSnapshot.docs[index].data()
                                          as Map<String, dynamic>);
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Answers(
                                                questionId: data.questionId),
                                          ));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff201E1E),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color.fromARGB(
                                                    255, 0, 0, 0)
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
                                                AssetImage(data.askByPic!),
                                          ),
                                          title: Text(
                                            data.askByName!,
                                            style: GoogleFonts.alegreyaSans(
                                                color: const Color.fromARGB(
                                                    255, 211, 208, 208),
                                                fontSize: 20),
                                          ),
                                          subtitle: Text(
                                            data.askByEmail!,
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
                                            data.title!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Container(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            data.question!,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            alignment:
                                                AlignmentDirectional.topEnd,
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            AnswerQuestion(
                                                                questionID: data
                                                                    .questionId),
                                                      ));
                                                },
                                                child: StreamBuilder(
                                                  stream: FirebaseFirestore
                                                      .instance
                                                      .collection("askAnswers")
                                                      .where("questionId",
                                                          isEqualTo:
                                                              data.questionId)
                                                      .snapshots(),
                                                  builder: (_, snapshot) =>
                                                      BadgeIcon(
                                                    icon: const Iconify(
                                                      Ic.round_question_answer,
                                                      color: Colors.white,
                                                    ),
                                                    badgeCount:
                                                        (snapshot.hasData)
                                                            ? snapshot
                                                                .data!
                                                                .docChanges
                                                                .length
                                                            : 0,
                                                  ),
                                                ))),
                                      ]),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const Center(
                                child: Text(
                                  "No Question to be asked.",
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
    ;
  }
}
