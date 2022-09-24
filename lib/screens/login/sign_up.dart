import 'package:flutter/material.dart';
import 'package:okoul_quiz/providers/auth_provider.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/shared/input_text.dart';
import 'package:okoul_quiz/widgets/shared/loading_btn.dart';
import 'package:okoul_quiz/widgets/shared/shared_btn.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool isLoading = false;
  bool isOtpInputVisible = false;
  String errorMsg = "";

  bool isFieldEmpty(String text){
    if(text.isEmpty){
      setState(() {
        errorMsg = "Field is empty.";
      });
      return true;
    }
    setState(() {
      errorMsg = "";
    });
    return false;
  }

  @override
  void dispose() {
    _nameController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return GestureDetector(
      onTap: (){
          FocusScope.of(context).unfocus();
        },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Form(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/login.png',
                height: 350,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(paddingValue),
                  decoration: const BoxDecoration(
                      color: whiteColor,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(50))),
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Text("Create Account", style: blackTextTitle),
                      const SizedBox(height: 30),
                      Text("Name", style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 10),
                      InputText(hint: "Enter your name", controller: _nameController),
                      Text(errorMsg, style: TextStyle(color: dangerColor),),
                      const SizedBox(height: 50),
                      isLoading 
                      ? LoadingBtn() 
                      : SharedBtn(
                        color: primaryColor, 
                        title: "Done", 
                        titleColor: whiteColor,
                        action: () async {
                          setState(() {
                            isLoading = true;
                          });
                          if(!isFieldEmpty(_nameController.text)){
                            auth.registerName(_nameController.text);
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                        ),
                        isLoading ? Container() : TextButton(
                        onPressed: () {auth.logout();},
                         child: Text("Go Back")
                         ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}