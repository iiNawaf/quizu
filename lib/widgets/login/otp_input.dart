import 'package:flutter/material.dart';
import 'package:okoul_quiz/screens/login/login.dart';
import 'package:okoul_quiz/style/styles.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpInput extends StatelessWidget {
  OtpFieldController controller;
  String otp;
  OtpInput({required this.controller, required this.otp});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OTPTextField(
        fieldStyle: FieldStyle.box,
        otpFieldStyle: OtpFieldStyle(focusBorderColor: primaryColor),
        fieldWidth: 50,
          length: 4,
          controller: controller,
          onChanged: (pin) {
            LoginScreen.otp = pin;
          },
          onCompleted: (pin) {
            LoginScreen.otp = pin;
          }),
    );
  }
}
