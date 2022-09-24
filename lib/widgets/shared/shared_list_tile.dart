import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';

class SharedListTile extends StatelessWidget {
  int index;
  String title;
  String trailing;
  SharedListTile({required this.title, required this.trailing, required this.index});
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
          contentPadding: EdgeInsets.all(paddingValue),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundColor: primaryColor,child: Text(index.toString(), style: whiteSubTextTitle)),
          ),
          title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
          trailing: Text(trailing.toString(), style: Theme.of(context).textTheme.titleSmall),
        ),
      ),
    );
  }
}
