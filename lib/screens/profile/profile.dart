
import 'package:flutter/material.dart';
import 'package:okoul_quiz/providers/auth_provider.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/shared/shared_btn.dart';
import 'package:okoul_quiz/widgets/shared/shared_list_tile.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: whiteColor,
              child: Image.asset('./assets/icons/user.png', height: 80)
            ),
            Text("${auth.loggedInUser!.name}", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 5),
            Text("${auth.loggedInUser!.mobile}", style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 25),
            SharedBtn(action: ()=> auth.logout(), color: dangerColor, title: "Logout", titleColor: whiteColor),
            SizedBox(height: 10),
            Divider(),
            Row(
              children: [
                Text("My Scores", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            SizedBox(height: 10),
            auth.scoresList!.length == 0
            ? Center(child: Text("No results."),)
            : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: auth.scoresList!.length,
              itemBuilder: (context, index){
                int reversedIndex = auth.scoresList!.length - 1 - index;
                return SharedListTile(
                  index: index+1,
              title: "${auth.scoresList![reversedIndex].split('":"')[0].substring(2)}",
              trailing: "${auth.scoresList![reversedIndex].split('":"')[1].substring(0,1)}",
            );
              },
            )
          ],
        ),
      ),
    );
  }
}