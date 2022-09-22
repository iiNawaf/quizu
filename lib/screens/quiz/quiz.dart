import 'dart:async';

import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/quiz/choice.dart';
import 'package:okoul_quiz/widgets/quiz/question.dart';
import 'package:okoul_quiz/screens/result/result.dart';
import 'package:okoul_quiz/widgets/quiz/timer.dart';
import 'package:okoul_quiz/widgets/shared/shared_btn.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Timer _timer;
  int _seconds = 60;
  int _minutes = 1;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_seconds == 0 && _minutes == 0) {
          setState(() {
            _timer.cancel();
          });
        } else if(_seconds == 0) {
          setState(() {
            _minutes -= 1;
            _seconds = 60;
            Navigator.push(context, MaterialPageRoute(builder: (context) => QuizResult()));
          });
          
        }else{
          setState(() {
            _seconds--;
          });
        }
      },
    );
  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(paddingValue),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: whiteColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QuizTimer(mins: _minutes, secs: _seconds),
                    SizedBox(height: 50),
                    QuizQuestion(question: "What is the capital of albania?")
                  ],
                )),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 2.8,
              children: [
                QuizChoice(
                  choice: "bobo",
                ),
                QuizChoice(
                  choice: "bobo",
                ),
                QuizChoice(
                  choice: "bobo",
                ),
                QuizChoice(
                  choice: "bobo",
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(paddingValue),
              child: SharedBtn(
                action: (){},
                color: Colors.grey,
                title: "Skip",
                titleColor: whiteColor
                ),
            )
          ],
        ),
      ),
    );
  }
}
