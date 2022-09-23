import 'package:flutter/material.dart';
import 'package:okoul_quiz/providers/auth_provider.dart';
import 'package:okoul_quiz/widgets/login/otp_input.dart';
import 'package:okoul_quiz/widgets/login/phone_number_input.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/shared/loading_btn.dart';
import 'package:okoul_quiz/widgets/shared/shared_btn.dart';
import 'package:phone_number/phone_number.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otp1Controller = TextEditingController();
  final TextEditingController _otp2Controller = TextEditingController();
  final TextEditingController _otp3Controller = TextEditingController();
  final TextEditingController _otp4Controller = TextEditingController();
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
                      Text("Login", style: blackTextTitle),
                      const SizedBox(height: 60),
                      Text(isOtpInputVisible ? "Verification Code" : "Phone number", style: blackSubTextTitle),
                      const SizedBox(height: 10),
                      isOtpInputVisible 
                      ? OtpInput(controller1: _otp1Controller, controller2: _otp2Controller, controller3: _otp3Controller, controller4: _otp4Controller,) 
                      : PhoneNumberInput(controller: _phoneNumberController, isError: errorMsg == "" ? false : true,),
                      Text(errorMsg, style: TextStyle(color: dangerColor),),
                      const SizedBox(height: 50),
                      isLoading ? LoadingBtn() : SharedBtn(
                        color: primaryColor, 
                        title: isOtpInputVisible ? "Check" : "Start", 
                        titleColor: whiteColor,
                        action: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final otp = _otp1Controller.text + _otp2Controller.text + _otp3Controller.text + _otp4Controller.text;
                          if(isOtpInputVisible){
                              if(!isFieldEmpty(otp)){
                                final result = await auth.login(otp, "+966${_phoneNumberController.text.replaceAll(" ", "")}");
                                setState(() {
                                  errorMsg = result;
                                });
                              }else{
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }else{
                              if(!isFieldEmpty(_phoneNumberController.text)){
                                bool isValid = await PhoneNumberUtil().validate(_phoneNumberController.text, regionCode: 'SA');
                                if(isValid){
                                  setState(() {
                                isOtpInputVisible = true;
                              });
                                }else{
                                  setState(() {
                                    errorMsg = "Phone number is invalid!";
                                  });
                                }
                                
                              }else{
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }
                            setState(() {
                              isLoading = false;
                            });
                        },
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
