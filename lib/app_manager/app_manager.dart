import 'package:flutter/material.dart';
import 'package:okoul_quiz/screens/home/home.dart';
import 'package:okoul_quiz/screens/leaderboard/leaderboard.dart';
import 'package:okoul_quiz/screens/profile/profile.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/shared/shared_appbar.dart';

class AppManager extends StatefulWidget {
  static int currentIndex = 0;
  @override
  State<AppManager> createState() => _AppManagerState();
}

class _AppManagerState extends State<AppManager> {
  List<Widget> _screens = [
    HomeScreen(),
    LeaderboardScreen(),
    MyProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      AppManager.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), child: SharedAppBar()),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryColor,
          currentIndex: AppManager.currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('./assets/icons/home.png',
                  height: 30,
                  color: AppManager.currentIndex == 0 ? primaryColor : textColor),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('./assets/icons/leaderboard.png',
                  height: 30,
                  color:AppManager.currentIndex == 1 ? primaryColor : textColor),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('./assets/icons/user-profile.png',
                  height: 30,
                  color:AppManager.currentIndex == 2 ? primaryColor : textColor),
              label: '',
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(paddingValue),
            child: _screens.elementAt(AppManager.currentIndex)));
  }
}
