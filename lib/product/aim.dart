import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooting_game/component/custom_image.dart';
import 'package:shooting_game/core/extension/image_extension.dart';

import '../core/base/enum/image_enum.dart';

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
        child: IgnorePointer(child: CustomImage(height: 168, width: 168, imagePath: ImagePaths.aim.path())),
      ),
    );
  }
}