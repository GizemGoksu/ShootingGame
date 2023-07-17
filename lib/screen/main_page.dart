import 'package:flutter/material.dart';
import 'package:shooting_game/component/custom_image.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomImage(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, imagePath: 'assets/images/bg.jpg'),
          CustomImage(height: 265, width: 165, imagePath: 'assets/images/target.png'),

          
        ],
      ),
    );
  }
}
