import 'package:flutter/material.dart';

class SharedBtn extends StatelessWidget {
  String title;
  Color color;
  Color titleColor;
  Function() action;
  SharedBtn({required this.action, required this.color, required this.title, required this.titleColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(title,
                style: TextStyle(
                    fontSize: 20,
                    color: titleColor,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}