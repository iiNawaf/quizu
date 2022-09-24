import 'package:flutter/material.dart';
import 'package:okoul_quiz/providers/auth_provider.dart';
import 'package:okoul_quiz/screens/quiz/quiz.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/home/ranking_box.dart';
import 'package:okoul_quiz/widgets/home/total_points_box.dart';
import 'package:okoul_quiz/widgets/shared/shared_btn.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi ${auth.loggedInUser!.name}", style: Theme.of(context).textTheme.titleSmall),
          Text("Are you ready to compete?",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                  child: RankingBox(
                icon: Image.asset('./assets/icons/rank.png'),
                title: "Rank",
                userRank: "1",
                totalUsersRanking: "123",
              )),
              const SizedBox(width: 5),
              Expanded(
                  child: TotalPointsBox(
                icon: Image.asset('./assets/icons/points.png'),
                totalPoints: "2000",
              )),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              Text("Ready to test your knowledge and challenge others?",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 25),
              Text("Answer as much questions correctly within 2 minutes",
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 15),
              SharedBtn(
                action: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen())),
                color: primaryColor,
                title: "Quiz Me",
                titleColor: whiteColor
                ),
            ],
          )
        ],
      ),
    );
  }
}
