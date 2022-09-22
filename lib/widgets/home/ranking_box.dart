import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';

class RankingBox extends StatelessWidget {
  Widget icon;
  String title;
  String userRank;
  String totalUsersRanking;
  RankingBox({required this.icon, required this.title, required this.userRank, required this.totalUsersRanking});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingValue),
      height: 70,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rank",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Row(
                children: [
                  Text(userRank + " of ",
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(totalUsersRanking, style: Theme.of(context).textTheme.titleMedium),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
