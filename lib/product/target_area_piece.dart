import 'package:flutter/material.dart';
import 'package:shooting_game/core/util/base_utility.dart';

class TargetArea extends StatelessWidget {
  const TargetArea({super.key,required this.height,required this.width,required this.onTap});

  final double height;
  final double width;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(55),color: AppColors.transparent),
      ),
    );
  }
}
