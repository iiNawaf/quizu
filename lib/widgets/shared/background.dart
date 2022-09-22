import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';

class Background extends StatelessWidget {
  Widget child;
  Background({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(paddingValue),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  primaryColor,
                  bgColor,
                ],
              )
            ),
            child: Center(child: child),
          ),
    );
  }
}