import 'package:flutter/material.dart';
import 'package:okoul_quiz/providers/auth_provider.dart';
import 'package:okoul_quiz/widgets/login/otp_input.dart';
import 'package:okoul_quiz/widgets/login/phone_number_input.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:okoul_quiz/widgets/shared/loading_btn.dart';
import 'package:okoul_quiz/widgets/shared/shared_btn.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:phone_number/phone_number.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static String otp = "";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final OtpFieldController _otpController = OtpFieldController();
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
    _phoneNumberController.clear();
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
                      Text("Login", style: blackTextTitle),
                      const SizedBox(height: 30),
                      Text(isOtpInputVisible ? "Verification Code" : "Mobile", style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 10),
                      isOtpInputVisible 
                      ? OtpInput(controller: _otpController, otp: LoginScreen.otp) 
                      : PhoneNumberInput(controller: _phoneNumberController, isError: errorMsg == "" ? false : true,),
                      Text(errorMsg, style: const TextStyle(color: dangerColor),),
                      const SizedBox(height: 50),
                      isLoading ? LoadingBtn() : SharedBtn(
                        color: primaryColor, 
                        title: isOtpInputVisible ? "Check" : "Start", 
                        titleColor: whiteColor,
                        action: () async {
                          setState(() {
                            isLoading = true;
                          });
                          if(isOtpInputVisible){
                              if(!isFieldEmpty(LoginScreen.otp)){
                                final result = await auth.login(LoginScreen.otp, "+966${_phoneNumberController.text.replaceAll(" ", "")}");
                                if(result == "Unauthorized! Your OTP is invalid"){
                                  setState(() {
                                    errorMsg = result;
                                  });
                                }
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
