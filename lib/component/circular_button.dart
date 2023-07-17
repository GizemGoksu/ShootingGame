import 'package:flutter/material.dart';
import 'package:shooting_game/core/base/util/base_utility.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {super.key,
      required this.radius,
      required this.color,
      this.isOutlined = false,
      required this.onTap,
      this.icon});
  final double radius;
  final Color color;
  final bool isOutlined;
  final Function() onTap;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 2 * radius,
            width: 2 * radius,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: Border.all(
                    color: isOutlined ? AppColors.black : AppColors.transparent,
                    width: isOutlined ? 2 : 0)
                ),
            child: icon ?? const SizedBox.shrink(),
          ),
        );
  }
}
