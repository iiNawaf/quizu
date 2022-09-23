import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:okoul_quiz/models/score.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoresProvider with ChangeNotifier{
  final baseUrl = "https://quizu.okoul.com";
  List<Score> _topScores = [];
  List<Score> get topScores => _topScores;

  Future<void> fetchLeaderboard() async{
    final storage = await SharedPreferences.getInstance();
    if(storage.containsKey("token")){
      final url = Uri.parse("$baseUrl/TopScores");
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${storage.getString("token")}'
        },
      );

      final jsonResponseData = jsonDecode(response.body).cast<Map<String, dynamic>>();

      if(response.statusCode == 200){
        _topScores = jsonResponseData.map<Score>((json) => Score.fromJson(json)).toList();
      }
      print("hi");
      notifyListeners();
    }

    
  }
}