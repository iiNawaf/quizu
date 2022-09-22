import 'package:flutter/material.dart';
import 'package:okoul_quiz/widgets/login/otp_input.dart';
import 'package:okoul_quiz/widgets/login/phone_number_input.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/shared/input_text.dart';
import 'package:okoul_quiz/widgets/shared/shared_btn.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _otp1Controller = TextEditingController();
  final TextEditingController _otp2Controller = TextEditingController();
  final TextEditingController _otp3Controller = TextEditingController();
  final TextEditingController _otp4Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          FocusScope.of(context).unfocus();
        },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 80),
              Image.asset(
                'assets/icons/ideas.png',
                height: 100,
              ),
              const Text(
                "QuizU",
                style: TextStyle(
                    fontSize: 50, fontWeight: FontWeight.bold, color: whiteColor),
              ),
              const SizedBox(height: 20),
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
                      const Text("Login",
                          style: TextStyle(
                              fontSize: 21,
                              color: textColor,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 80),
                      PhoneNumberInput(controller: _phoneNumberController),
                      OtpInput(controller1: _otp1Controller, controller2: _otp2Controller, controller3: _otp3Controller, controller4: _otp4Controller,),
                      InputText(hint: "Enter your name", controller: _nameController),
                      const SizedBox(height: 50),
                      SharedBtn(
                        color: primaryColor, 
                        title: "Start", 
                        titleColor: whiteColor,
                        action: (){},
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
