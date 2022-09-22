import 'package:flutter/material.dart';
import 'package:okoul_quiz/app_manager/app_manager.dart';
import 'package:okoul_quiz/screens/quiz/quiz.dart';
import 'package:okoul_quiz/screens/quiz/quiz_fail.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/screens/result/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MaterialApp(
        title: 'Okoul Quiz',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: AppManager()
      ),
    );
  }
}