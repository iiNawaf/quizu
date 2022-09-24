import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';

class ExitBtn extends StatelessWidget {
  Function() action;
  ExitBtn({required this.action});
  @override
  Widget build(BuildContext context) {
    return Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: action,
                  child: const CircleAvatar(
                    backgroundColor: primaryColor,
                    child: Icon(Icons.close, color: whiteColor),
                    ),
                ));
  }
}