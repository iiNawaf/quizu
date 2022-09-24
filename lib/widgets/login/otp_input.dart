import 'package:flutter/material.dart';
import 'package:okoul_quiz/screens/login/login.dart';
import 'package:otp_text_field/otp_text_field.dart';

class OtpInput extends StatelessWidget {
  OtpFieldController controller;
  String otp;
  OtpInput({required this.controller, required this.otp});
  @override
  Widget build(BuildContext context) {
    return OTPTextField(
        length: 4,
        controller: controller,
        onChanged: (pin) {
          LoginScreen.otp = pin;
        },
        onCompleted: (pin) {
          LoginScreen.otp = pin;
        });
  }
}
