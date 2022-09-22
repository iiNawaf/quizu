import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';

class TotalPointsBox extends StatelessWidget {
  Widget icon;
  String totalPoints;
  TotalPointsBox({required this.icon, required this.totalPoints});
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
                "Total Points",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(totalPoints, style: Theme.of(context).textTheme.titleMedium),
            ],
          )
        ],
      ),
    );
  }
}