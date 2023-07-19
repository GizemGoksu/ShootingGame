import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooting_game/component/circular_button.dart';
import 'package:shooting_game/component/custom_image.dart';
import 'package:shooting_game/component/outlined_text.dart';
import 'package:shooting_game/controller/game_controller.dart';
import 'package:shooting_game/core/base/enum/image_enum.dart';
import 'package:shooting_game/core/base/util/base_utility.dart';
import 'package:shooting_game/core/constants/app_const.dart';
import 'package:shooting_game/core/extension/image_extension.dart';
import 'package:shooting_game/product/aim.dart';
import 'package:shooting_game/product/gun.dart';
import '../core/base/enum/button_purpose_enum.dart';
import '../product/target.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final GameController gameController = Get.put(GameController());
  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerMove: (event) => gameController.draggingFunction(event),
      onPointerUp: (event) => gameController.clickingScreenFunction(event),
      child: Scaffold(
        floatingActionButton: tripleFloatingActionButton(),
        body: Stack(
          children: [
            background(context),
            target(),
            Gun(left: gameController.xPosition),
            Aim(top: gameController.yPosition,left: gameController.xPosition,),
            totalPointText(),
          ],
        ),
      ),
    );
  }

  Target target() {
    return Target(
            isMoving: gameController.isMoving,
            isLeft: gameController.isLeft,
            isSpeedUp: gameController.isSpeedUp,
            onAnimationEnd: () => gameController.animationOnEnd(),
            onTap: (point) => gameController.shooting(point),
    );
  }

  CustomImage background(BuildContext context) {
    return CustomImage(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              imagePath: ImagePaths.background.path());
  }

  Column tripleFloatingActionButton() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularButton(ButtonPurpose.restart),
          circularButton(ButtonPurpose.speedUpDown),
          circularButton(ButtonPurpose.stopMove)
        ],
      );
  }

  Padding circularButton(ButtonPurpose purpose) {
    return Padding(
      padding: purpose == ButtonPurpose.speedUpDown
          ? const EdgeInsets.symmetric(vertical: 12)
          : EdgeInsets.zero,
      child: CircularButton(
        radius: 30,
        color: AppColors.laser,
        isOutlined: true,
        onTap:  purpose == ButtonPurpose.speedUpDown 
               ? () => gameController.increaseDecreaseSpeed()
               : purpose == ButtonPurpose.restart
                  ? () => gameController.restart()
                  : () => gameController.startStopMovement(),                                              
        icon:  purpose == ButtonPurpose.speedUpDown 
               ? AppIcons.speed
               : purpose == ButtonPurpose.restart
                  ? AppIcons.restart
                  : AppIcons.stop
      ),
    );
  }

  Padding totalPointText() {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Center(
        child: Column(children: [
          OutlinedText(text: AppConst.totalPoint,fontSize: 48,),
          Obx(() => OutlinedText(text: gameController.totalPoints.string,fontSize: 48,)),
        ]),
      ),
    );
  }
}

