import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';

class QuizChoice extends StatelessWidget {
  String choice;
  QuizChoice({required this.choice});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingValue),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: primaryColor)
        ),
        child: Center(child: Text(choice, style: Theme.of(context).textTheme.titleLarge,)),
      ),
    );
  }
}