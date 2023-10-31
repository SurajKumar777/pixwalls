import 'package:flutter/material.dart';
import 'package:pixwalls/presentation/widgets/custom_text.dart';

class CustomSnackBar extends StatelessWidget {
  final String text;
  Color? color;
  CustomSnackBar({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: CustomText(
        text: text,
        color: Colors.white,
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
    );
  }
}
