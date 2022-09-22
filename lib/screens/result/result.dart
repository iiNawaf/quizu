
import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/result/share_options.dart';
import 'package:okoul_quiz/widgets/shared/background.dart';
import 'package:okoul_quiz/widgets/shared/shared_btn.dart';

class QuizResult extends StatelessWidget {
  const QuizResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    child: Icon(Icons.close, color: whiteColor),
                    ),
                )),
              Image.asset('./assets/icons/hourglass.png', height: 250),
              const Text("Time is up!", style: textTitle),
              const SizedBox(height: 30),
              const Text("You have completed", style: subTextTitle),
              const SizedBox(height: 5),
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  color: whiteColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: const Center(child: Text("10", style: subTextTitle)),
              ),
              const SizedBox(height: 5),
              const Text("Correct Answers!", style: subTextTitle),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(paddingValue),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: whiteColor
                ),
                child: Column(
                  children: [
                    Text("Share your result", style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 20),
                    const ShareOptions(),
                    const SizedBox(height: 20),
                    SharedBtn(
                      title: "Share",
                      titleColor: whiteColor,
                      color: primaryColor,
                      action: (){},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}