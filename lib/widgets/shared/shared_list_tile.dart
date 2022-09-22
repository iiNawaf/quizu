import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';

class SharedListTile extends StatelessWidget {
  const SharedListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
      ),
      child: ListTile(
        title: Text("Date"),
        trailing: Text("10"),
      ),
    );
  }
}
