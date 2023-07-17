import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooting_game/component/custom_image.dart';
import 'package:shooting_game/product/aim.dart';
import 'package:shooting_game/product/gun.dart';

import '../product/target.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int total = 0;

  RxBool isMoving = false.obs;

  RxBool isLeft = true.obs;

  RxDouble xPosition = (0.0).obs;

  RxDouble yPosition = (0.0).obs;

  late AudioPlayer player;

  void initState() {
    super.initState();
    print('init');
    player = AudioPlayer()..setSource(AssetSource('assets/gun_shot.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerMove: (event) {
        xPosition.value += event.delta.dx;
        yPosition.value += event.delta.dy;
      },
      onPointerUp: (event) {
        xPosition.value = event.position.dx - 85;
        yPosition.value = event.position.dy - 85;
      },
      child: Scaffold(
        floatingActionButton: InkWell(
          onTap: () {
            print('float');
            //movement(context);
            //isLeft.value = false;
            isMoving.value = !isMoving.value;
            if (isMoving.value == false) {
              isLeft.value = !isLeft.value;
            }
          },
          child: Container(
            height: 50,
            width: 50,
            color: Colors.red,
          ),
        ),
        body: Stack(
          children: [
            CustomImage(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                imagePath: 'assets/bg.jpg'),
            Target(
                isMoving: isMoving,
                isLeft: isLeft,
                onEnd: () => isLeft.value = !isLeft.value,
                onTap: (point) {
                  total = total + point;
                  player.play(AssetSource('assets/gun_shot.mp3'));
                  print(total);
                }),
            Gun(
              left: xPosition,
            ),
            Aim(left: xPosition, top: yPosition)
          ],
        ),
      ),
    );
  }
}
