import 'package:flutter/material.dart';
import 'package:okoul_quiz/providers/scores_provider.dart';
import 'package:okoul_quiz/screens/loading/loading.dart';
import 'package:okoul_quiz/widgets/shared/shared_list_tile.dart';
import 'package:provider/provider.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  bool isInit = true;
  bool isLoading = false;
  @override
  void didChangeDependencies() {
    if(isInit){
      setState(() {
      isLoading = true;
    });
    final scoresProvider = Provider.of<ScoresProvider>(context, listen: false);
    scoresProvider.fetchLeaderboard();
    setState(() {
      isLoading = false;
    });
    isInit = false;
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final scoresProvider = Provider.of<ScoresProvider>(context);
    return isLoading 
    ? LoadingScreen() 
    : SingleChildScrollView(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: scoresProvider.topScores.length,
        itemBuilder: (context, index){
          return SharedListTile(
            index: index+1,
            title: scoresProvider.topScores[index].name,
            trailing: scoresProvider.topScores[index].score.toString(),
          );
        }
        ),
    );
  }
}