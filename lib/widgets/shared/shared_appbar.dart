import 'package:flutter/material.dart';
import 'package:okoul_quiz/app_manager/app_manager.dart';

class SharedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppManager.currentIndex == 0 
      ? "Home" 
      : AppManager.currentIndex == 1 
      ? "Leaderboard" 
      : "My Profile",
      ),
    );
  }
}