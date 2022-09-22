import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/shared/shared_btn.dart';
import 'package:okoul_quiz/widgets/shared/shared_list_tile.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: whiteColor,
              child: Image.asset('./assets/icons/user.png', height: 80)
            ),
            Text("Name", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 5),
            Text("+966594789491", style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 25),
            SharedBtn(action: (){}, color: dangerColor, title: "Logout", titleColor: whiteColor),
            SizedBox(height: 10),
            Divider(),
            Row(
              children: [
                Text("My Scores", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            SizedBox(height: 10),
            SharedListTile()
          ],
        ),
      ),
    );
  }
}