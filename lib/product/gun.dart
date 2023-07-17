import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooting_game/component/custom_image.dart';

class Gun extends StatelessWidget {
  const Gun({super.key,required this.left});
  final RxDouble left;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        left: left.value,
        bottom: 0,
        child: const IgnorePointer(child: CustomImage(height: 200, width: 120, imagePath: 'assets/gun.png')),
      ),
    );
  }
}
