import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:okoul_quiz/models/question.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class QuestionProvider with ChangeNotifier{
  final baseUrl = "https://quizu.okoul.com";
  List<Question> _questionsList = [];
  List<Question> get questionsList => _questionsList;

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
      print(jsonResponseData);
      if(response.statusCode == 200){
        _questionsList = jsonResponseData.map<Question>((json) => Question.fromJson(json)).toList();
      }
    }
  }

  
}