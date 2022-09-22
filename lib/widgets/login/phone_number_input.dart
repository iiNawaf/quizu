import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:okoul_quiz/style/styles.dart';

class PhoneNumberInput extends StatelessWidget {
  TextEditingController controller;
  PhoneNumberInput({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor
      ),
      child: InternationalPhoneNumberInput(
                textFieldController: controller,
                initialValue: PhoneNumber(phoneNumber: "+966", dialCode: "+966", isoCode: "SA"),
                cursorColor: primaryColor,
                  selectorConfig: const SelectorConfig(
                    leadingPadding: 10,
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      showFlags: true,
                      setSelectorButtonAsPrefixIcon: true),
                  onInputChanged: (PhoneNumber number) {
                    print(number);
                  },
                  hintText: "Phone Number",
                ),
    );
  }
}