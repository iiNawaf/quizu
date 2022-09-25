[LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)

# QuizU

QuizU is an application made with Flutter that allows people to join a quiz for 2 minutes and collect as possible points by answering the questions correct.

## Installation

Step 1:

Download or clone this repository using the link below:
```
https://github.com/iiNawaf/quizu.git
```

Step 2:

Go to project root and execute the following command in console/terminal to get the required dependencies:
```
flutter pub get
```

Step 3:

Choose the device that you want to run the app with and execute the following command:
```
flutter run
```

## QuizU Screens:
- Home
- Leaderboard
- Login
- Sign up
- Quiz
- Quiz Result
- Quiz Failed
- Profile

## Libraries Used:
- [Intl Phone Number Input](https://pub.dev/packages/intl_phone_number_input)
- [Provider](https://pub.dev/packages/provider)
- [http](https://pub.dev/packages/http)
- [Shared preferences](https://pub.dev/packages/shared_preferences)
- [Flutter Spinkit](https://pub.dev/packages/flutter_spinkit)
- [Phone Number](https://pub.dev/packages/phone_number)
- [intl](https://pub.dev/packages/intl)
- [Share Plus](https://pub.dev/packages/share_plus)
- [Otp Text Field](https://pub.dev/packages/otp_text_field)
- [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons)
- [Flutter Native Splash](https://pub.dev/packages/flutter_native_splash)

## Folder Structure

This is the core folder structure.
```
okoul_quiz/
|- android
|- assets
|- ios
|- lib
|- linux
|- macos
|- test
|- web
|- windows
```

This is the folder structure that we have been working on this project.
```
lib/
|- app_manager/
|- models/
|- providers/
|- screens/
|- style/
|- widgets/
|- main.dart
```

This is the lib folder which has the main application code.
- app_manager: Contains the controller page of the app.
- models: Contains all the objects of the app.
- providers: Contains all functionalities of the app different features.
- screens: Contains the the screens of the page.
- style: Contains the default styles of the app.
- widgets: Contains the widgets of each screen to prevent widgets duplications.
- main.dart: The starting point of the application.

#### App Manager:

```
app_manager/
|- app_manager.dart
```

#### Models
```
models/
|- question.dart
|- score.dart
|- user.dart
```

#### Providers
```
providers/
|- auth_provider.dart
|- question_provider.dart
|- scores_provider.dart
```

#### Screens
```
screens/
|- home/
    |- home.dart

|- leaderboard/
    |- leaderboard.dart

|- loading/
    |- loading.dart

|- login/
    |- login.dart
    |- sign_up.dart

|- profile/
    |- profile.dart

|- quiz/
    |- quiz_fail.dart
    |- quiz_result.dart
    |- quiz.dart
```

#### Style
```
style/
|- styles.dart
```

#### Widgets
```
widgets/
|- home/
    |- quiz_me_btn.dart

|- login/
    |- otp_input.dart
    |- phone_number_input.dart

|- quiz/
    |- choice.dart
    |- question.dart
    |- timer.dart

|- shared/
    |- background.dart
    |- exit_btn.dart
    |- input_text.dart
    |- loading_btn.dart
    |- shared_appbar.dart
    |- shared_btn.dart
    |- shared_list_tile.dart
```

### Thank you ❤