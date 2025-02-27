import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      height: 1.25,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      height: 1.25,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      height: 1.25,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      height: 1.25,
    );
  }

  static TextStyle styleRegular20(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      height: 1.25,
    );
  }

  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      height: 1.25,
    );
  }

  static TextStyle styleBold24(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      height: 1.25,
    );
  }

  static TextStyle styleBold28(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 28),
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      height: 1.25,
    );
  }
}

double getResoponsiveFontSize(BuildContext context,
    {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFotSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFotSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  return width / 1200;
}
