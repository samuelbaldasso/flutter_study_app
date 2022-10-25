import 'package:flutter/material.dart';
import 'package:flutter_study_app/config/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorDark = Color(0xFF2e3c62);
const Color primaryColorDark = Color(0xFF99ace1);
const Color mainTextColor = Colors.white;

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDark = ThemeData.dark();
    return systemDark.copyWith(
        iconTheme: getIconTheme(), textTheme: getTextThemes().apply(
          bodyColor: mainTextColor,
          displayColor: mainTextColor
        ));
  }
}
