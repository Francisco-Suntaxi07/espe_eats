import 'package:flutter/material.dart';

double screenWidth = 0;
double screenHeight = 0;

extension ScreenSize on double {
  double getScreenWidth(
      {required BuildContext context, double multiplier = 0}) {
    var width = multiplier * MediaQuery.of(context).size.width;
    if (multiplier != 0) {
      width = width * multiplier;
    }
    return width;
  }

  double getScreenHeight(
      {required BuildContext context, double multiplier = 0}) {
    var height = MediaQuery.of(context).size.height;
    if (multiplier != 0) {
      height = height * multiplier;
    }
    return height;
  }
}
