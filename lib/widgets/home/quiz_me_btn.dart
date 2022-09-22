import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';

class QuizMeBtn extends StatelessWidget {
  const QuizMeBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: primaryColor),
        child: const Center(
          child: Text("Quiz Me",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: whiteColor)),
        ),
      ),
    );
  }
}
