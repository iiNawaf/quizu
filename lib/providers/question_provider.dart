import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okoul_quiz/models/question.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class QuestionProvider with ChangeNotifier{
  final baseUrl = "https://quizu.okoul.com";
  List<Question> _questionsList = [];
  List<Question> get questionsList => _questionsList;
  bool isSkipped = false;
  int questionIndex = 0;
  int currentScore = 0;

  Future<dynamic> fetchQuestions() async{
    final storage = await SharedPreferences.getInstance();
    if(storage.containsKey("token")){
      final url = Uri.parse("$baseUrl/Questions");
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${storage.getString("token")}'
        },
      );
      final jsonResponseData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      if(response.statusCode == 200){
        _questionsList = jsonResponseData.map<Question>((json) => Question.fromJson(json)).toList();
      }
    }
  }

  Future<void> resetQuiz() async{
    questionIndex = Random().nextInt(_questionsList.length);
    currentScore = 0;
    isSkipped = false;
  }

  Future<void> goToNextQuestion() async{
    questionIndex = Random().nextInt(_questionsList.length);
    currentScore++;
  }

  Future<void> skipQuestion() async{
    questionIndex = Random().nextInt(_questionsList.length);
  }

  List<String> choices(int index) {
    List<String> choices = [];
    _questionsList[index].answers.values.forEach((value) {
      choices.add(value);
    });
    return choices;
  }

  List<String> keys(int index) {
    List<String> keys = [];
    _questionsList[index].answers.keys.forEach((key) {
      keys.add(key);
    });
    return keys;
  }

  bool isCorrectAnswer(int index){
    if(keys(questionIndex)[index] != questionsList[questionIndex].correctAnswer){
      return false;
    }else{
      return true;
    }
  }

  
}