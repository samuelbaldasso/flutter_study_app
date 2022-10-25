import 'package:flutter/material.dart';
import 'package:flutter_study_app/config/themes/app_dark_theme.dart';
import 'package:flutter_study_app/config/themes/app_light_theme.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  late final ThemeData _dark = DarkTheme().buildDarkTheme();
  late final ThemeData _light = LightTheme().buildLightTheme();
  
  @override
  void OnInit() {
    super.onInit();
  }

  ThemeData get darkTheme => _dark;
  ThemeData get lightTheme => _light;
}
