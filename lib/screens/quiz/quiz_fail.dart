import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/shared/background.dart';
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
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    child: Icon(Icons.close, color: whiteColor),
                    ),
                )),
                Image.asset('./assets/icons/wrong.png'),
                Text("Wrong Answer", style: whiteTextTitle),
                SizedBox(height: 100),
                SharedBtn(
                  title: "Try Again",
                  titleColor: whiteColor,
                  color: primaryColor,
                  action: (){},
                )
            ],
          ),
        ),
      ),
    );
  }
}