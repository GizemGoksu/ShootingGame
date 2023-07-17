import 'package:flutter/material.dart';
import 'package:shooting_game/core/base/util/base_utility.dart';

class TargetAreaPiece extends StatelessWidget {
  const TargetAreaPiece(
      {super.key,
      required this.height,
      required this.width,
      required this.point,
      required this.onTap});

  final double height;
  final double width;
  final int point;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      borderRadius: generalBorderRadius,
      child: InkWell(
        onTap: () => onTap(point),
        child: Container(
          height: height,
          width: width,
          decoration: decoration(),
        ),
      ),
    );
  }

  BoxDecoration decoration() => BoxDecoration(borderRadius: generalBorderRadius,color: AppColors.transparent);
}
