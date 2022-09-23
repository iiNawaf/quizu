import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:okoul_quiz/providers/question_provider.dart';
import 'package:okoul_quiz/screens/loading/loading.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/quiz/choice.dart';
import 'package:okoul_quiz/widgets/quiz/question.dart';
import 'package:okoul_quiz/screens/result/result.dart';
import 'package:okoul_quiz/widgets/quiz/timer.dart';
import 'package:okoul_quiz/widgets/shared/shared_btn.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool isInit = true;
  bool isLoading = false;
  @override
  void didChangeDependencies() async{
    if(isInit){
      setState(() {
        isLoading = true;
      });
      final questionProvider = Provider.of<QuestionProvider>(context, listen: false);
      await questionProvider.fetchQuestions();
      setState(() {
        isLoading = false;
      });
    }
    super.didChangeDependencies();
  }
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

  int i = 0;
  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<QuestionProvider>(context);
    return isLoading 
    ? LoadingScreen() 
    : Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(paddingValue),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
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
                    const SizedBox(height: 50),
                    QuizQuestion(question: "${questionProvider.questionsList[i].question}")
                  ],
                )),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.7
                ),
              itemCount: 4,
              itemBuilder: (context, index){
                return QuizChoice(
                  action: (){
                    print(questionProvider.questionsList[i].answers[index]);
                    print(questionProvider.questionsList[i].correctAnswer);
                  },
                  choice: "${questionProvider.questionsList[i].answers[index]}",
                );
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(paddingValue),
              child: SharedBtn(
                action: (){
                  i = Random().nextInt(questionProvider.questionsList.length);
                },
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
