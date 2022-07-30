import 'package:flutter/cupertino.dart';
import 'package:get/instance_manager.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;
  static double? screenPercentage;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    // screenWidth=375;
    // screenHeight=812;

    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! / 100 - _safeAreaHorizontal! / 100);
    safeBlockVertical = (screenHeight! / 100 - _safeAreaVertical! / 100);
  }

  static double? getFullWidth() {
    return screenWidth;
  }

  static double? getFullHeight() {
    return screenHeight;
  }

  static double calculateTextSize(int fontSize) {
    return safeBlockHorizontal! * (fontSize * 6.6) / 27;
  }

  static double calculateBlockVertical(double blockSize) {
    var size = (blockSize / 896) * screenHeight!;
    Get.log("mediaSize: $screenHeight, $screenWidth, size: $size");
    return size;
  }

  static double calculateBlockHorizontal(double blockSize) {
    var size = (blockSize / 414) * screenWidth!;
    return size;
  }
}
