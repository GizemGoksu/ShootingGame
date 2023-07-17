import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooting_game/core/constants/app_const.dart';

class GameController extends GetxController {
  RxInt totalPoints = 0.obs;

  RxBool isMoving = false.obs;
  RxBool isLeft = false.obs;
  RxBool isSpeedUp = false.obs;

  RxDouble xPosition = (50.0).obs;
  RxDouble yPosition = (200.0).obs;

  void draggingFunction(PointerMoveEvent event) {
    xPosition.value += event.delta.dx;
    yPosition.value += event.delta.dy;
  }

  void clickingScreenFunction(PointerUpEvent event) {
    xPosition.value = event.position.dx - AppConst.aimRadius;
    yPosition.value = event.position.dy - AppConst.aimRadius;
    // I substract aim radius value from event position values to make red dot in the center of aim position the place we click.
  }

  void startStopMovement() => isMoving.value = !isMoving.value;

  void animationOnEnd() => isLeft.value = !isLeft.value;

  void shooting(int point) => totalPoints.value = totalPoints.value + point;

  void restart() => totalPoints.value = 0;

  void increaseDecreaseSpeed() => isSpeedUp.value = !isSpeedUp.value;
}
