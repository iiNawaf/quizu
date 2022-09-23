import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';

class SharedListTile extends StatelessWidget {
  int index;
  String name;
  int score;
  SharedListTile({required this.name, required this.score, required this.index});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
        ),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(index.toString(), style: Theme.of(context).textTheme.titleMedium,),
          ),
          title: Text(name),
          trailing: Text(score.toString()),
        ),
      ),
    );
  }
}
