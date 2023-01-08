// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiver/async.dart';

class countDownWidget extends StatefulWidget {
  int _start = 15;
  int _current = 15;
  double? _fontSize = 80;
  late final func;
  late CountdownTimer countDownTimer;
  static var sub;

  // widget.sub =@iver
  countDownWidget() {}

  countDownWidget.custom(int i,
      {super.key, start, current, double? fontSize, required this.func}) {
    _fontSize = fontSize;
    countDownTimer = CountdownTimer(
      Duration(seconds: _start),
      const Duration(seconds: 1),
    );
    countDownWidget.sub = countDownTimer.listen(null);
  }

  @override
  State<countDownWidget> createState() => _countDownWidgetState();
}

class _countDownWidgetState extends State<countDownWidget> {
  void startTimer() {
    countDownWidget.sub.onData((duration) {
      setState(() {
        widget._current = widget._start - duration.elapsed.inSeconds as int;
      });
    });

    countDownWidget.sub.onDone(() {
      countDownWidget.sub.cancel();
      widget.func[0]();
    });
  }

  @override
  void initState() {
    super.initState();
    widget.func[1]();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${widget._current}",
      style: GoogleFonts.alegreyaSans(color: Colors.white, fontSize: 80),
    );
  }
}
