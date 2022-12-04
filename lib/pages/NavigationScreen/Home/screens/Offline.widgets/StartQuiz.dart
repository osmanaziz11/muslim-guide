import 'package:app/pages/NavigationScreen/Home/screens/Offline.widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiver/async.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({super.key});

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
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
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            header("Are you ready?"),
            Text(
              'Brace yourself to tackle questions',
              style: GoogleFonts.alegreyaSans(
                  color: const Color(0xFF5A5A5A), fontSize: 14),
            ),
            Container(
              width: double.infinity,
              height: 300,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "$_current",
                    style: GoogleFonts.alegreyaSans(
                        color: Colors.white, fontSize: 80),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 50),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff1E1E1E)),
                      onPressed: () {},
                      child: Text(
                        'Start',
                        style: GoogleFonts.alegreyaSans(
                            color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
