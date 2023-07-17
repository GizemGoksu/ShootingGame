import 'package:flutter/material.dart';

class AppColors {
  static Color transparent = Colors.transparent;
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color laser = const Color.fromRGBO(205, 170, 118, 1);
}

class AppIcons {
  static Icon stop = Icon(Icons.pan_tool,color: AppColors.black,size: 35,);
  static Icon speed = Icon(Icons.speed,color: AppColors.black,size: 35,);
  static Icon restart = Icon(Icons.restart_alt,color: AppColors.black,size: 35,);
}
