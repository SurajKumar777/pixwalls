import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final Widget? prifixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool isNum;
  final bool? isEnable;
  final bool isSecure;
  String? Function(String?)? validation;
  TextEditingController controller;
  final bool isBorder;
  final bool isTextCapitalize;

  CustomInput({
    super.key,
    this.prifixIcon,
    this.hintText,
    required this.controller,
    this.isNum = false,
    this.isSecure = false,
    required this.validation,
    this.suffixIcon,
    this.isBorder = false,
    this.isEnable,
    this.isTextCapitalize = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnable,
      controller: controller,
      keyboardType: isNum ? TextInputType.phone : TextInputType.text,
      obscureText: isSecure,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prifixIcon,
        suffixIcon: suffixIcon,
        border: isBorder ? const OutlineInputBorder() : null,
      ),
      onChanged: isTextCapitalize
          ? (value) {
              controller.value = TextEditingValue(
                  text: value.toUpperCase(), selection: controller.selection);
            }
          : null,
      validator: validation,
    );
  }
}
