import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooting_game/component/circular_button.dart';
import 'package:shooting_game/component/custom_image.dart';
import 'package:shooting_game/component/custom_text.dart';
import 'package:shooting_game/controller/game_controller.dart';
import 'package:shooting_game/core/base/enum/image_enum.dart';
import 'package:shooting_game/core/base/util/base_utility.dart';
import 'package:shooting_game/core/constants/app_const.dart';
import 'package:shooting_game/core/extension/image_extension.dart';
import 'package:shooting_game/product/aim.dart';
import 'package:shooting_game/product/gun.dart';

import '../product/target.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  int total = 0;
  RxBool isMoving = false.obs;
  RxBool isLeft = true.obs;
  RxDouble xPosition = (0.0).obs;
  RxDouble yPosition = (0.0).obs;
  //final player = AudioPlayer();
  GameController gameController = Get.put(GameController());
  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerMove: (event) => gameController.draggingFunction(event),
      onPointerUp: (event) => gameController.clickingScreenFunction(event),
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           CircularButton(radius: 30, color: AppColors.laser,isOutlined: true, onTap: () => gameController.restart(),icon: AppIcons.restart,),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 12),
             child: CircularButton(radius: 30, color: AppColors.laser,isOutlined: true,onTap: () => gameController.increaseDecreaseSpeed(),icon: AppIcons.speed,),
           ),
           CircularButton(radius: 30, color: AppColors.laser,isOutlined: true, onTap: () => gameController.startStopMovement(),icon: AppIcons.stop,),
        ],),
        body: Stack(
          children: [
            CustomImage(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                imagePath: ImagePaths.background.path()),
            Target(
              isMoving: gameController.isMoving,
              isLeft: gameController.isLeft,
              isSpeedUp: gameController.isSpeedUp,
              onEnd: () => gameController.animationOnEnd(),
              onTap: (point) => gameController.shooting(point),
            ),
            Gun(left: gameController.xPosition),
            Aim(left: gameController.xPosition, top: gameController.yPosition),
            totalPointText(),
          ],
        ),
      ),
    );
  }

  Padding totalPointText() {
    return Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Center(
              child: Column(
                children:[
                  CustomText(text: AppConst.totalPoint),
                  Obx(() => CustomText(text: gameController.totalPoints.string)),
              ]),
            ),
          );
  }
}
