import 'package:flutter/material.dart';
import 'package:okoul_quiz/app_manager/app_manager.dart';
import 'package:okoul_quiz/providers/auth_provider.dart';
import 'package:okoul_quiz/providers/question_provider.dart';
import 'package:okoul_quiz/providers/scores_provider.dart';
import 'package:okoul_quiz/screens/loading/loading.dart';
import 'package:okoul_quiz/screens/login/login.dart';
import 'package:okoul_quiz/screens/login/sign_up.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ScoresProvider()),
        ChangeNotifierProvider(create: (context) => QuestionProvider())
      ],
      child: MaterialApp(
        title: 'Okoul Quiz',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, _){
            return FutureBuilder(
          future: authProvider.autoLogin(),
          builder: (context, snapshot){
            return snapshot.connectionState == ConnectionState.done 
            ? snapshot.hasData 
            ? authProvider.loggedInUser!.name == null 
            ? SignUpScreen() : AppManager() 
            : LoginScreen() 
            : LoadingScreen();
          },
        );
          },
        )
      ),
    );
  }
}