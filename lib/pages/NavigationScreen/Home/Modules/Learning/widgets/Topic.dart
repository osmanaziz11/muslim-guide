import 'package:app/customWidget/Appbar.dart';
import 'package:app/customWidget/CircularLoader.dart';
import 'package:app/customWidget/MainHeading.dart';
import 'package:app/navigation.dart';
import 'package:app/pages/NavigationScreen/Home/Modules/Learning/widgets/Youtube.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class ChooseTopic extends StatefulWidget {
  String category;
  late List channels;
  ChooseTopic({super.key, required this.category});

  @override
  State<ChooseTopic> createState() => _ChooseTopicState();
}

class _ChooseTopicState extends State<ChooseTopic> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool videoModule = false;
  InkWell choosenTopic(name, info) {
    return InkWell(
      onTap: () {
        Navigation.appNavigation.currentState!.pop();
      },
      child: Container(
        height: 500,
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            child: Icon(Icons.timelapse),
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
          ),
          title: Text(
            name,
            style: GoogleFonts.comfortaa(
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(202, 255, 253, 253),
                fontSize: 15),
          ),
          subtitle: Text(
            info,
            style: GoogleFonts.comfortaa(
              fontWeight: FontWeight.w900,
              color: const Color.fromARGB(202, 255, 253, 253),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(const Iconify(
        MaterialSymbols.arrow_back_ios_rounded,
        color: Colors.white,
        size: 44,
      )),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          MainHeading("Choose Channels"),
          Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              // alignment: AlignmentDirectional.,

              height: 450,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Learning')
                    .doc(widget.category)
                    .collection('channels')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      QuerySnapshot dataSnapshot =
                          snapshot.data as QuerySnapshot;
                      if (dataSnapshot.docs.length > 0) {
                        return ListView.builder(
                          itemCount: dataSnapshot.docs.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Youtube(
                                          videos: dataSnapshot.docs[index]
                                              ['videos']),
                                    ))
                              },
                              child: ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(Icons.timelapse),
                                  margin: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(
                                  dataSnapshot.docs[index]['name'],
                                  style: GoogleFonts.comfortaa(
                                      fontWeight: FontWeight.w900,
                                      color: const Color.fromARGB(
                                          202, 255, 253, 253),
                                      fontSize: 15),
                                ),
                                subtitle: Text(
                                  dataSnapshot.docs[index]['subscriber'],
                                  style: GoogleFonts.comfortaa(
                                    fontWeight: FontWeight.w900,
                                    color: const Color.fromARGB(
                                        202, 255, 253, 253),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text(
                            "No channels found.",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                    } else {
                      return Center(
                        child: CircularLoader(),
                      );
                    }
                  } else {
                    return Center(
                      child: CircularLoader(),
                    );
                  }
                },
              ))
        ]),
      ),
    );
  }
}
