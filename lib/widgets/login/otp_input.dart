import 'package:flutter/material.dart';
import 'package:okoul_quiz/widgets/shared/input_text.dart';

class OtpInput extends StatelessWidget {
  TextEditingController controller1;
  TextEditingController controller2;
  TextEditingController controller3;
  TextEditingController controller4;
  OtpInput(
      {required this.controller1,
      required this.controller2,
      required this.controller3,
      required this.controller4});

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60,
          width: 60,
          child: InputText(
            textAlign: TextAlign.center,
            hint: "-",
            controller: controller1,
            length: 1,
            focusNode: focusNode1,
            onChanged: (value) {
              FocusScope.of(context).requestFocus(focusNode2);
            },
          ),
        ),
        Container(
          height: 60,
          width: 60,
          child: InputText(
            textAlign: TextAlign.center,
            hint: "-",
            controller: controller2,
            focusNode: focusNode2,
            length: 1,
            onChanged: (value) {
              FocusScope.of(context).requestFocus(focusNode3);
            },
          ),
        ),
        Container(
          height: 60,
          width: 60,
          child: InputText(
            textAlign: TextAlign.center,
            hint: "-",
            controller: controller3,
            length: 1,
            focusNode: focusNode3,
            onChanged: (value) {
              FocusScope.of(context).requestFocus(focusNode4);
            },
          ),
        ),
        Container(
          height: 60,
          width: 60,
          child: InputText(
            textAlign: TextAlign.center,
            hint: "-",
            controller: controller4,
            focusNode: focusNode4,
            length: 1,
            onChanged: (value) {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ],
    );
  }
}
