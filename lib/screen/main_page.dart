import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooting_game/component/custom_image.dart';

import '../product/target.dart';

class MainPage extends StatelessWidget {
   MainPage({super.key});
  int total = 0;
  RxBool isMoving = false.obs;
  RxBool isLeft = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomImage(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, imagePath: 'assets/images/bg.jpg'),
          Target(
          isMoving: isMoving,
          isLeft: isLeft,
          onEnd: () => isLeft.value = !isLeft.value,
          onTap: (point) {
            total = total + point;
            isMoving.value = !isMoving.value;
            print(isMoving);
            isLeft.value = !isLeft.value;
            print(isLeft);

            print(total);
          }),
          
        ],
      ),
    );
  }
}
