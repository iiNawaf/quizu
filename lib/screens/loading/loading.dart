import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:okoul_quiz/style/styles.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: whiteColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitHourGlass(
                    size: 60,
                    color: primaryColor,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Please wait...",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
