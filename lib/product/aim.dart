import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooting_game/component/custom_image.dart';

class Aim extends StatelessWidget {
  const Aim({super.key,required this.left,required this.top});
  final RxDouble top;
  final RxDouble left;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        top: top.value,
        left: left.value,
        child: const IgnorePointer(child: CustomImage(height: 168, width: 168, imagePath: 'assets/aim.png')),
      ),
    );
  }
}