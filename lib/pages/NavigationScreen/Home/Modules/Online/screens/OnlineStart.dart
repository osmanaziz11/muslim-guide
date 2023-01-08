import 'package:app/customWidget/CircularLoader.dart';
import 'package:app/customWidget/MainHeading.dart';
import 'package:app/customWidget/countDown.dart';
import 'package:app/models/QuizQuestion.dart';
import 'package:app/navigation.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Offline/widgets/Countdown.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Offline/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiver/async.dart';

class OnlineStart extends StatefulWidget {
  late var timer;
  int questionIndex = 0;
  late String? topicID;
  OnlineStart({super.key, this.topicID});

  @override
  State<OnlineStart> createState() => _OnlineStartState();
}

class _OnlineStartState extends State<OnlineStart> {
  FirebaseAuth _auth = FirebaseAuth.instance;
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
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: 600,
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: (status) ? Quiz() : countdown(changeStatus: QuizStatus)),
    );
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
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            );

            // if we got our data
          } else if (snapshot.hasData) {
            // Extracting data from snapshot object

            QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;

            if (widget.questionIndex >= dataSnapshot.docs.length) {
              return Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    MainHeading("Score "),
                    Container(
                        width: 350,
                        height: 200,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 65,
                                height: 150,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                alignment: AlignmentDirectional.center,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: const BoxDecoration(),
                                      width: double.infinity,
                                      height: 60,
                                      child: CircleAvatar(
                                        backgroundImage: (_auth
                                                    .currentUser!.photoURL !=
                                                "0")
                                            ? NetworkImage(_auth.currentUser!
                                                .photoURL!) as ImageProvider
                                            : const AssetImage(
                                                "assets/images/avatar1.png"),
                                      ),
                                    ),
                                    Text(
                                      "${res}/${dataSnapshot.docs.length}",
                                      style: GoogleFonts.alegreya(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              242, 255, 255, 255),
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 65,
                                height: 150,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                alignment: AlignmentDirectional.center,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: const BoxDecoration(),
                                      width: double.infinity,
                                      height: 60,
                                      child: const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/avatar1.png"),
                                      ),
                                    ),
                                    Text(
                                      "${5}/${dataSnapshot.docs.length}",
                                      style: GoogleFonts.alegreya(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              242, 255, 255, 255),
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ]))
                  ]));
            } else {
              QuizQuestion topic = QuizQuestion.fromMap(
                  dataSnapshot.docs[widget.questionIndex].data()
                      as Map<String, dynamic>);
              return Column(
                children: [
                  Text(
                    "Question ${widget.questionIndex + 1}/${dataSnapshot.docs.length}",
                    style: GoogleFonts.alegreyaSans(
                        color: const Color.fromARGB(255, 172, 171, 171),
                        fontSize: 18),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Text(
                      textAlign: TextAlign.center,
                      topic.title,
                      style: GoogleFonts.alegreya(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 280,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    alignment: AlignmentDirectional.center,
                    child: ListView.builder(
                        itemCount: topic.options.length,
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
                                if (widget.questionIndex <
                                    dataSnapshot.docs.length) {
                                  widget.questionIndex++;
                                }
                              });
                              print(index);
                            },
                            child: ListTile(
                              leading: Container(
                                width: 40,
                                height: 40,
                                child: const Icon(Icons.timelapse),
                                margin: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:
                                      _isSelected ? Colors.red : Colors.white,
                                ),
                              ),
                              title: Text(
                                topic.options[index],
                                style: GoogleFonts.comfortaa(
                                    fontWeight: FontWeight.w900,
                                    color: const Color.fromARGB(
                                        202, 255, 253, 253),
                                    fontSize: 15),
                              ),
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
