import 'dart:ffi';
import 'dart:io';

import 'package:app/customWidget/CircularLoader.dart';
import 'package:app/customWidget/MainHeading.dart';
import 'package:app/customWidget/countDown.dart';
import 'package:app/models/QuizQuestion.dart';
import 'package:app/navigation.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Offline/widgets/Countdown.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Offline/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiver/async.dart';

class StartQuiz extends StatefulWidget {
  late var timer;
  int questionIndex = 1;
  late String? topicID;
  StartQuiz({super.key, this.topicID});

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  List _selectedIndexs = [];
  bool ansCheck = false;
  Color ansColor = Colors.white;
  bool status = false;
  int res = 0;
  void _nextQuestion() {
    setState(() {
      widget.questionIndex++;
    });
  }

  void initializeSub() {
    widget.timer = countDownWidget.sub;
  }

  void QuizStatus() {
    setState(() {
      status = true;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 500,
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: (status) ? Quiz() : countdown(changeStatus: QuizStatus));
  }

  StreamBuilder Quiz() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('OF_QUIZ_TOPIC')
          .doc(widget.topicID)
          .collection('questions')
          .snapshots(),
      builder: (ctx, snapshot) {
        // Checking if future is resolved or not
        if (snapshot.connectionState == ConnectionState.active) {
          // If we got an error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            );

            // if we got our data
          } else if (snapshot.hasData) {
            // Extracting data from snapshot object

            QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;
            QuizQuestion topic = QuizQuestion.fromMap(
                dataSnapshot.docs[0].data() as Map<String, dynamic>);
            if (widget.questionIndex > dataSnapshot.docs.length) {
              return Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainHeading("Score"),
                      Text(
                        "${res}/${dataSnapshot.docs.length}",
                        style: GoogleFonts.alegreya(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(242, 255, 255, 255),
                            fontSize: 40),
                      ),
                    ]),
              );
            } else {
              return Column(
                children: [
                  Text(
                    "Question ${widget.questionIndex}/${dataSnapshot.docs.length}",
                    style: GoogleFonts.alegreyaSans(
                        color: Color.fromARGB(255, 172, 171, 171),
                        fontSize: 18),
                  ),
                  MainHeading(topic.title),
                  Container(
                    height: 350,
                    child: GridView.builder(
                        itemCount: topic.options.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0),
                        itemBuilder: (context, index) {
                          final _isSelected = _selectedIndexs.contains(index);
                          return InkWell(
                            onTap: () {
                              ansCheck = true;

                              if (topic.answerIndex == index) {
                                res++;
                              }

                              widget.timer.cancel();
                              setState(() {
                                widget.questionIndex++;
                              });
                              print(index);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(Icons.timelapse),
                                  margin: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        _isSelected ? Colors.red : Colors.white,
                                  ),
                                ),
                                Text(
                                  topic.options[index],
                                  style: GoogleFonts.comfortaa(
                                      fontWeight: FontWeight.w900,
                                      color: const Color.fromARGB(
                                          202, 255, 253, 253),
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  countDownWidget.custom(
                    80,
                    func: [_nextQuestion, initializeSub],
                  ),
                ],
              );
            }
          }
        }

        // Displaying LoadingSpinner to indicate waiting state
        return Center(
          child: CircularLoader(),
        );
      },
    );
  }
}
