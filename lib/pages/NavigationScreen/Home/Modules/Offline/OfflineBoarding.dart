// ignore_for_file: file_names

import 'package:app/customWidget/MainHeading.dart';
import 'package:app/models/Of_topics.dart';
import 'package:app/navigation.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Offline/screens/StartQuiz.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Offline/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OfflineBoardingScreen extends StatefulWidget {
  const OfflineBoardingScreen({super.key});

  @override
  State<OfflineBoardingScreen> createState() => _OfflineBoardingScreenState();
}

class _OfflineBoardingScreenState extends State<OfflineBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MainHeading("Offline Quiz"),
              Text(
                'Choose the topic you want us to assess',
                style: GoogleFonts.alegreyaSans(
                    color: const Color(0xFF5A5A5A), fontSize: 14),
              ),
              Container(
                  width: double.infinity,
                  height: 500,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('OF_QUIZ_TOPIC')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.hasData) {
                            QuerySnapshot dataSnapshot =
                                snapshot.data as QuerySnapshot;
                            return GridView.builder(
                                itemCount: dataSnapshot.docs.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 15.0,
                                        mainAxisSpacing: 15.0),
                                itemBuilder: (context, index) {
                                  OfflineQuizTopic topic =
                                      OfflineQuizTopic.fromMap(
                                          dataSnapshot.docs[index].data()
                                              as Map<String, dynamic>);
                                  print("ID: ${dataSnapshot.docs[index].id}");
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => StartQuiz(
                                                  topicID: dataSnapshot
                                                      .docs[index].id)));
                                    },
                                    child: Container(
                                      height: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.question_answer,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            topic.title,
                                            style: GoogleFonts.alegreyaSans(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                    ),
                                  );
                                });
                          } else {
                            return Center(
                              child: Text("No topics found."),
                            );
                          }
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
