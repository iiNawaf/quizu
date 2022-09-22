import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';

class InputText extends StatelessWidget {
  String hint;
  int? length;
  Function(String)? onChanged;
  FocusNode? focusNode;
  TextAlign? textAlign;
  TextEditingController controller;
  InputText({required this.hint, required this.controller, this.length, this.onChanged, this.focusNode, this.textAlign});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          onChanged: onChanged,
          maxLength: length,
          focusNode: focusNode,
          textAlign: textAlign ?? TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
            controller: controller,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              hintText: hint,
              counterText: ""
            )));
  }
}
