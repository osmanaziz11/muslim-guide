import 'package:app/pages/NavigationScreen/Home/screens/Learning.widgets/Youtube.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseTopic extends StatefulWidget {
  const ChooseTopic({super.key});

  @override
  State<ChooseTopic> createState() => _ChooseTopicState();
}

class _ChooseTopicState extends State<ChooseTopic> {
  bool videoModule = false;
  InkWell choosenTopic(name, info) {
    return InkWell(
      onTap: () {
        setState(() {
          videoModule = true;
        });
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
              color: Colors.white,
            ),
          ),
          Text(
            name,
            style: GoogleFonts.comfortaa(
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(202, 255, 253, 253),
                fontSize: 15),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (videoModule
        ? Youtube()
        : Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(children: [
              Container(
                width: double.infinity,
                height: 100,
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Manual Search",
                  style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(201, 0, 0, 0),
                      fontSize: 20),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  // alignment: AlignmentDirectional.,
                  height: 260,
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            choosenTopic('Merciful Servant', '1M Subscriber'),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      }))
            ]),
          ));
  }
}
