import 'package:flutter/material.dart';
import 'package:okoul_quiz/style/styles.dart';

class InputText extends StatelessWidget {
  String hint;
  int? length;
  Function(String)? onChanged;
  FocusNode? focusNode;
  TextAlign? textAlign;
  TextEditingController controller;
  double? height;
  double? width;
  String? errorText;
  TextInputType? keyboardType;
  InputText({required this.hint, required this.controller, this.length, this.onChanged, this.focusNode, this.textAlign, this.height, this.width, this.errorText, this.keyboardType});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10),),
        child: TextFormField(
          onChanged: onChanged,
          maxLength: length,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textAlign: textAlign ?? TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
            controller: controller,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              hintText: hint,
              counterText: "",
            )));
  }
}
