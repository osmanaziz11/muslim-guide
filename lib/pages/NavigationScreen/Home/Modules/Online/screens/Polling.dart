// ignore_for_file: file_names

import 'package:app/customWidget/Appbar.dart';
import 'package:app/customWidget/CircularLoader.dart';
import 'package:app/customWidget/MainHeading.dart';
import 'package:app/customWidget/countDown.dart';
import 'package:app/models/Of_topics.dart';
import 'package:app/navigation.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Offline/screens/StartQuiz.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Offline/widgets/widgets.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Online/screens/OnlineStart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:quiver/async.dart';

class Polling extends StatefulWidget {
  late String id;
  Polling({super.key, required this.id});

  @override
  State<Polling> createState() => _PollingState();
}

class _PollingState extends State<Polling> {
  void topicSelect() {
    print('Hi');
  }

  void abc() {}

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
        height: 600,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainHeading("Online Quiz"),
                Text(
                  'Polling Start',
                  style: GoogleFonts.alegreyaSans(
                      color: const Color(0xFF5A5A5A), fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: double.infinity,
                    color: Colors.black,
                    height: 350,
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
                                                builder: (context) =>
                                                    OnlineStart(
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
                                child: CircularLoader(),
                              );
                            }
                          }
                          return Center(
                            child: CircularLoader(),
                          );
                        })),
                countDownWidget.custom(20, func: [topicSelect, abc])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
