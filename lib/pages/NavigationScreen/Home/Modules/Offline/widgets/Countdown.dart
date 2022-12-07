import 'package:app/customWidget/MainHeading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiver/async.dart';

class countdown extends StatefulWidget {
  final changeStatus;
  const countdown({super.key, required this.changeStatus});

  @override
  State<countdown> createState() => _countdownState();
}

class _countdownState extends State<countdown> {
  bool startQuiz = false;
  int _start = 15;
  int _current = 15;
  late var sub;
  void startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: _start),
      const Duration(seconds: 1),
    );

    sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds as int;
      });
    });

    sub.onDone(() {
      widget.changeStatus();
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(children: [
            MainHeading("Are you ready?"),
            Text(
              'Brace yourself to tackle questions',
              style: GoogleFonts.alegreyaSans(
                  color: const Color(0xFF5A5A5A), fontSize: 14),
            ),
          ]),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$_current",
                style: GoogleFonts.alegreyaSans(
                    color: Colors.white, fontSize: 100),
              ),
            ],
          )),
        ),
        Container(
          height: 40,
          width: 120,
          margin: const EdgeInsets.only(top: 50),
          // padding: EdgeInsets.symmetric(horizontal: 50),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1E1E1E)),
            onPressed: () {
              sub.cancel();
              widget.changeStatus();
            },
            child: Text(
              'Start',
              style:
                  GoogleFonts.alegreyaSans(color: Colors.white, fontSize: 28),
            ),
          ),
        ),
      ],
    );
  }
}
