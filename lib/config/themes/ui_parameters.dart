import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double _padding = 10.0;
const double _mobileScreenPadding = 25;
const double _cardBorderRadius = 10;
double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderRadius => _cardBorderRadius;
double get padding => _padding;

class UIParameters {
  static BorderRadius get cardBorderRadius =>
      BorderRadius.circular(_cardBorderRadius);

  static EdgeInsets get mobileScreenPadding =>
      const EdgeInsets.all(_mobileScreenPadding);

 static EdgeInsets get padding =>
      const EdgeInsets.all(_padding);

  static bool isDarkMode() {
    return Get.isDarkMode ? true : false;
  }
}
