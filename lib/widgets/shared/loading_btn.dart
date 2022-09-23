import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:okoul_quiz/style/styles.dart';

class LoadingBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFadingCircle(
        duration: Duration(milliseconds: 500),
        color: primaryColor,
      ),
    );
  }
}