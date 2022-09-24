import 'dart:async';

import 'package:flutter/material.dart';
import 'package:okoul_quiz/providers/question_provider.dart';
import 'package:okoul_quiz/screens/loading/loading.dart';
import 'package:okoul_quiz/screens/quiz/quiz_fail.dart';
import 'package:okoul_quiz/screens/quiz/quiz_result.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/quiz/choice.dart';
import 'package:okoul_quiz/widgets/quiz/question.dart';
import 'package:okoul_quiz/widgets/quiz/timer.dart';
import 'package:okoul_quiz/widgets/shared/exit_btn.dart';
import 'package:okoul_quiz/widgets/shared/shared_btn.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin{
  bool isInit = true;
  bool isLoading = false;
  @override
  void didChangeDependencies() async {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      final qp = Provider.of<QuestionProvider>(context, listen: false);
      await qp.fetchQuestions();
      await qp.resetQuiz();
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
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_seconds == 0 && _minutes == 0) {
          setState(() {
            _timer.cancel();
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) => QuizResultScreen()));
        } else if (_seconds == 0) {
          setState(() {
            _minutes -= 1;
            _seconds = 60;
          });
        } else {
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
    super.initState();
    animation = AnimationController(vsync: this, duration: const Duration(milliseconds: 500),);
    _fadeInFadeOut = Tween<double>(begin: 1.0, end: 0.0).animate(animation);
    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Future.delayed(const Duration(milliseconds: 500), (){
          animation.reverse();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    animation.dispose();
    super.dispose();
  }

  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;

  @override
  Widget build(BuildContext context) {
    final qp = Provider.of<QuestionProvider>(context);
    return isLoading
        ? const LoadingScreen()
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(paddingValue),
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
                          ExitBtn(
                            action: () => showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: const Text("Quit the quiz"),
                                content: const Text("Are you sure your want to quit the quiz?"),
                                actions: [
                                  TextButton(
                                    child: const Text("Yes"),
                                    onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                                  ),
                                  TextButton(
                                    child: const Text("No"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              );
                            })
                          ),
                          QuizTimer(mins: _minutes, secs: _seconds),
                          const SizedBox(height: 50),
                          QuizQuestion(
                              question:
                                  qp.questionsList[qp.questionIndex].question)
                        ],
                      )),
                  GridView.builder(
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 2.5),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return FadeTransition(
                            opacity: _fadeInFadeOut,
                            child: QuizChoice(
                              action: () async{
                                if(qp.isCorrectAnswer(index)){
                                  await animation.forward();
                                  await qp.goToNextQuestion();
                                }else{
                                  setState(() {
                                    _timer.cancel();
                                  });
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizFailScreen()));
                                }
                              },
                              choice: qp.choices(qp.questionIndex)[index],
                            ),
                          );
                        },
                      ),
                  Padding(
                    padding: const EdgeInsets.all(paddingValue),
                    child: SharedBtn(
                        action: () async {
                          await animation.forward();
                          qp.skipQuestion();
                        },
                        color: Colors.grey,
                        title: "Skip",
                        titleColor: whiteColor),
                  )
                ],
              ),
            ),
          );
  }
}
