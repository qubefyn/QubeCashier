import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
  }

  static bool get isMobile => screenWidth < 600;
  static bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  static bool get isWeb => screenWidth >= 1024;
}