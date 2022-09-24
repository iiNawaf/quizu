import 'package:flutter/material.dart';
import 'package:okoul_quiz/providers/question_provider.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:provider/provider.dart';

class QuizChoice extends StatelessWidget {
  String choice;
  Function() action;
  QuizChoice({required this.choice, required this.action});
  @override
  Widget build(BuildContext context) {
    final qp = Provider.of<QuestionProvider>(context);
    return TextButton(
      onPressed: action,
      child: Padding(
        padding: const EdgeInsets.all(paddingValue),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: primaryColor),
          ),
          child: Center(child: Text(choice, style: Theme.of(context).textTheme.titleLarge,)),
        ),
      ),
    );
  }
}