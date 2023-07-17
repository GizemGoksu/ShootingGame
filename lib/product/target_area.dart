import 'package:flutter/material.dart';
import 'package:shooting_game/product/target_area_piece.dart';

class TargetArea extends StatelessWidget {
  const TargetArea({super.key,required this.onTap});

  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        TargetAreaPiece(height: 150, width: 119, point: 6, onTap: onTap),
        TargetAreaPiece(height: 119, width: 94, point: 7, onTap: onTap),
        TargetAreaPiece(height: 88, width: 70, point: 8, onTap: onTap),
        TargetAreaPiece(height: 57, width: 45, point: 9, onTap: onTap),
        TargetAreaPiece(height: 34, width: 19, point: 10, onTap: onTap),
      ],
    );
  }
}
