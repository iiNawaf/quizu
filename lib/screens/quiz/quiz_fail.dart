import 'package:flutter/material.dart';
import 'package:okoul_quiz/screens/quiz/quiz.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/shared/background.dart';
import 'package:okoul_quiz/widgets/shared/exit_btn.dart';
import 'package:okoul_quiz/widgets/shared/shared_btn.dart';

class QuizFailScreen extends StatelessWidget {
  const QuizFailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              ExitBtn(action: ()=> Navigator.popUntil(context, (route) => route.isFirst),),
                Image.asset('./assets/images/wrong.png'),
                SizedBox(height: 30),
                Text("Wrong Answer", style: whiteTextTitle),
                SizedBox(height: 80),
                SharedBtn(
                  title: "Try Again",
                  titleColor: whiteColor,
                  color: primaryColor,
                  action: (){
                    Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => QuizScreen()));
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}