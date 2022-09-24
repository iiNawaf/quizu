import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';

class QuizChoice extends StatelessWidget {
  String choice;
  Function() action;
  QuizChoice({required this.choice, required this.action});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.all(paddingValue),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: primaryColor),
          ),
          child: Center(child: Text(choice, style: Theme.of(context).textTheme.titleMedium,)),
        ),
      ),
    );
  }
}