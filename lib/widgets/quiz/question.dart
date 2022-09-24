import 'package:flutter/material.dart';

class QuizQuestion extends StatefulWidget {
  String question;
  QuizQuestion({required this.question});
  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.question, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center);
  }
}