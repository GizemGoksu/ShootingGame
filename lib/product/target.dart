import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shooting_game/core/constants/app_const.dart';
import 'package:shooting_game/core/util/base_utility.dart';
import 'package:shooting_game/product/target_area.dart';
import '../component/custom_image.dart';

class Target extends StatelessWidget {
  const Target({super.key,required this.onTap,required this.onEnd,required this.isMoving,required this.isLeft});

  final Function(int) onTap;
  final Function() onEnd;
  final RxBool isMoving;
  final RxBool isLeft;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedAlign(
        duration: isMoving.value ? AppConst.animationDuration : AppConst.shorDuration,
        alignment: isMoving.value
                    ? isLeft.value 
                      ? Alignment.topLeft
                      : Alignment.topRight
                    : Alignment.topCenter,
        onEnd: onEnd,
        child: SizedBox(
          height: 475,
          width: 160,
          child: Stack(
            children: [
              Positioned(
                left: 78,
                child: Container(height: 220,width: 11,color: AppColors.black,)),
              Positioned(
                top: 210,
                child: const CustomImage(height: 265, width: 165, imagePath: 'assets/images/target.png')),
              Positioned(
                top: 313,
                left: 25,
                child: TargetArea(onTap: onTap)),
              Positioned(
                top: 242,
                left: 77,
                child: InkWell(
                  onTap: () => onTap(AppConst.headShotPoint),
                  child: Container(height: 12,width: 12,decoration: BoxDecoration(shape: BoxShape.circle,color:AppColors.transparent),)))
            ],
          ),
        ),
      ),
    );
  }
}
