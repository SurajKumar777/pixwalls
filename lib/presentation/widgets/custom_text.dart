import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  Color color;
  final double? size;
  final bool isBold;
  final bool isUnderline;
  TextAlign? align;
  TextOverflow? overflow;

  CustomText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.size,
    this.isBold = false,
    this.isUnderline = false,
    this.align,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : null,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
    );
  }
}
