import 'package:shooting_game/core/base/enum/image_enum.dart';

extension ImageExtension on ImagePaths {
  String path() {
    return 'assets/$name.png';
  }
}
