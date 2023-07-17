import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooting_game/component/circular_button.dart';
import 'package:shooting_game/core/base/enum/image_enum.dart';
import 'package:shooting_game/core/constants/app_const.dart';
import 'package:shooting_game/core/base/util/base_utility.dart';
import 'package:shooting_game/core/extension/image_extension.dart';
import 'package:shooting_game/product/target_area.dart';
import '../component/custom_image.dart';

class Target extends StatelessWidget {
  const Target(
      {super.key,
      required this.isMoving,
      required this.isLeft,
      required this.isSpeedUp,
      required this.onTap,
      required this.onAnimationEnd,
    });

  final RxBool isMoving;
  final RxBool isLeft;
  final RxBool isSpeedUp;
  final Function(int) onTap;
  final Function() onAnimationEnd;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedAlign(
        duration: isSpeedUp.value ? AppConst.highSpeedDuration : AppConst.normalSpeedDuration,
        alignment: isMoving.value
            ? isLeft.value
                ? Alignment.topLeft
                : Alignment.topRight
            : Alignment.topCenter,
        onEnd: onAnimationEnd,
        child: SizedBox(
          height: 475,
          width: 160,
          child: Stack(          
            children: [
              blackStick(),
              targetImage(),
              targetShootingArea(),
              headShotArea()
            ],
          ),
        ),
      ),
    );
  }

  Positioned headShotArea() {
    return Positioned(
                top: 242,
                left: 77,
                child: CircularButton(
                    radius: 6,
                    color: AppColors.transparent,
                    onTap: () => onTap(AppConst.headShotPoint)));
  }

  Positioned targetShootingArea() => Positioned(top: 313, left: 25, child: TargetArea(onTap: onTap));

  Positioned targetImage() {
    return Positioned(
                top: 210,
                child: CustomImage(
                    height: 265,
                    width: 165,
                    imagePath: ImagePaths.target.path()));
  }

  Positioned blackStick() {
    return Positioned(
                left: 78,
                child: Container(
                  height: 220,
                  width: 11,
                  color: AppColors.black,
                ));
  }
}
