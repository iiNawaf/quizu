import 'package:flutter/material.dart';
import 'package:okoul_quiz/widgets/shared/shared_list_tile.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SharedListTile()
        ],
      ),
    );
  }
}