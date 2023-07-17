import 'package:flutter/material.dart';
import '../core/base/util/base_utility.dart';

class OutlinedText extends StatelessWidget {
  const OutlinedText({super.key,
  required this.text,required this.fontSize});

  final String text;
  final double fontSize;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        outline() ,
        baseText(),
      ],
    );
  }

  Text baseText() {
    return Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: AppColors.white,
        ),
      );
  }

  Text outline() {
    return Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = AppColors.black,
        ),
      );
  }
}

