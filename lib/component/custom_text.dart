import 'package:flutter/material.dart';

import '../core/base/util/base_utility.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key,
  required this.text,});

  final String text;

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
          fontSize: 48,
          color: AppColors.white,
        ),
      );
  }

  Text outline() {
    return Text(
        text,
        style: TextStyle(
          fontSize: 48,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = AppColors.black,
        ),
      );
  }
}

