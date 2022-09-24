
import 'package:flutter/material.dart';
import 'package:okoul_quiz/providers/auth_provider.dart';
import 'package:okoul_quiz/providers/question_provider.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/shared/background.dart';
import 'package:okoul_quiz/widgets/shared/exit_btn.dart';
import 'package:okoul_quiz/widgets/shared/shared_btn.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class QuizResultScreen extends StatefulWidget {
  @override
  State<QuizResultScreen> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResultScreen> {
  bool isInit = true;
  bool isLoading = false;
  @override
  void didChangeDependencies() async{
    if(isInit){
      setState(() {
        isLoading = true;
      });
      final questionProvider = Provider.of<QuestionProvider>(context, listen: false);
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.submitScore(questionProvider.currentScore.toString());
      setState(() {
        isLoading = false;
      });
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final qp = Provider.of<QuestionProvider>(context);
    return Scaffold(
      body: Background(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              ExitBtn(action: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              }),
              Image.asset('./assets/images/time.png'),
              const SizedBox(height: 30),
              const Text("You have completed", style: whiteSubTextTitle),
              const SizedBox(height: 5),
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  color: whiteColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(child: Text("${qp.currentScore.toString()}", style: whiteSubTextTitle)),
              ),
              const SizedBox(height: 5),
              const Text("Correct Answers!", style: whiteSubTextTitle),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(paddingValue),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: whiteColor
                ),
                child: Column(
                  children: [
                    Text("Share your result", style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 20),
                    SharedBtn(
                      title: "Share",
                      titleColor: whiteColor,
                      color: primaryColor,
                      action: (){
                        Share.share("I answered ${qp.currentScore} correct answers in QuizU!", subject: "Subject");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}