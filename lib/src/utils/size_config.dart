import 'package:flutter/widgets.dart';

class SizeConfig {
  late MediaQueryData _mediaQueryData;
  late double screenWidth;
  late double screenHeight;
  late double screenHeightHalf;
  late double blockSizeHorizontal;
  late double blockSizeVertical;

  SizeConfig(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    screenHeightHalf = screenHeight / 2;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }

  double get height => screenHeight;
  double get horizontal1 => blockSizeHorizontal * 2;
  double get horizontal2 => blockSizeHorizontal * 4;
  double get horizontal3 => blockSizeHorizontal * 5;
  double get horizontal4 => blockSizeHorizontal * 6;

  double get widht => screenHeight;
  double get vertical1 => blockSizeVertical * 2;
  double get vertical2 => blockSizeVertical * 4;
  double get vertical3 => blockSizeVertical * 5;
  double get vertical4 => blockSizeVertical * 6;

  double get halfHeight => screenHeightHalf;
}
