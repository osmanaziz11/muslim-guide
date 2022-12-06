import 'package:app/pages/NavigationScreen/Home/screens/Offline.widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiver/async.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  InkWell option(text) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            child: Icon(Icons.timelapse),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
          ),
          Text(
            text,
            style: GoogleFonts.comfortaa(
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(202, 255, 253, 253),
                fontSize: 15),
          ),
        ],
      ),
    );
  }

  int _start = 15;
  int _current = 15;

  void startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: _start),
      Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            header("Question 10/10"),
            Text(
              'When Prophet SAWW was born in?',
              style: GoogleFonts.alegreyaSans(
                  color: const Color(0xFF5A5A5A), fontSize: 14),
            ),
            Container(
              width: double.infinity,
              height: 200,
              margin: const EdgeInsets.only(top: 0),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  option("text"),
                  option("text"),
                  option("text"),
                  option("text"),
                ],
              ),
            ),
            Text(
              "$_current",
              style:
                  GoogleFonts.alegreyaSans(color: Colors.white, fontSize: 50),
            ),
            Container(
              height: 40,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1E1E1E)),
                onPressed: () {},
                child: Text(
                  'Next',
                  style: GoogleFonts.alegreyaSans(
                      color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
