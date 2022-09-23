import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:okoul_quiz/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier{
  final baseUrl = "https://quizu.okoul.com";
  User? _loggedInUser;
  User? get loggedInUser => _loggedInUser;

  Future<dynamic> autoLogin() async{
    final storage = await SharedPreferences.getInstance();
    if(storage.containsKey("token")){
      final url = Uri.parse("$baseUrl/Token");
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${storage.getString("token")}'
        },
      );

    final localUserInfo = jsonDecode("${storage.getString("userInfo")}");
    if(response.statusCode == 200){
      _loggedInUser = User(
        name: localUserInfo['name'],
        mobile: localUserInfo['mobile'],
      );
      print(_loggedInUser!.name);
      return _loggedInUser;
    }
    }else{
      print("nope");
    }

  }

  Future<dynamic> login(String otp, String mobile) async{
    final url = Uri.parse("$baseUrl/Login");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        "OTP": otp,
        "mobile": mobile
      }),
    );
    final jsonResponseData = jsonDecode(response.body);
    final storage = await SharedPreferences.getInstance();

    if(response.statusCode == 201){
      if(jsonResponseData['message'] == "user created!"){
        //Case user not registered
        _loggedInUser = User(
          mobile: mobile,
      );
      final _loggedInUserInfo = jsonEncode({
        'mobile': mobile,
      });
      await storage.setString("userInfo", _loggedInUserInfo);
      }else{
        //Case user already exist
        _loggedInUser = User(
          name: jsonResponseData['name'],
          mobile: jsonResponseData['mobile'],
      );
      final _loggedInUserInfo = jsonEncode({
        'name': jsonResponseData['name'],
        'mobile': jsonResponseData['mobile'],
      });
      await storage.setString("userInfo", _loggedInUserInfo);
      }

      await storage.setString("token", jsonResponseData['token']);
      notifyListeners();
      return jsonResponseData;
    }else{
        if(jsonResponseData['success'] == false){
          print(jsonResponseData['message']);
          return jsonResponseData['message'];
      }
    }
  }

  Future<dynamic> registerName(String name) async{
    final storage = await SharedPreferences.getInstance();
    if(storage.containsKey("token")){
    final url = Uri.parse("$baseUrl/Name");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${storage.getString("token")}'
      },
      body: jsonEncode(<String, String>{
        "name": name,
      }),
    );
    final jsonResponseData = jsonDecode(response.body);
    if(response.statusCode == 201){
      print(jsonResponseData['name']);
      _loggedInUser = User(
        name: jsonResponseData['name'],
        mobile: jsonResponseData['mobile'],
      );
      final _loggedInUserInfo = jsonEncode({
        'name': jsonResponseData['name'],
        'mobile': jsonResponseData['mobile'],
      });
      await storage.setString("userInfo", _loggedInUserInfo);
      notifyListeners();
      return jsonResponseData;
    }
    }
    
  }

  void logout() async {
    final storage = await SharedPreferences.getInstance();
    storage.clear();
    _loggedInUser = null;
    notifyListeners();
  }
}