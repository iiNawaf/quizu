import 'dart:async';

import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';

class QuizTimer extends StatefulWidget {
  int mins;
  int secs;
  QuizTimer({required this.mins, required this.secs});
  @override
  State<QuizTimer> createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: primaryColor)),
      child: Center(child: Text(widget.secs < 10 ? "0${widget.mins}:0${widget.secs}" : "0${widget.mins}:${widget.secs}", style: TextStyle(fontSize: 40))),
    );
  }
}
