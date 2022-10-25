import 'package:flutter/material.dart';
import 'package:flutter_study_app/config/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorLight = Color(0xFF3ac3cb);
const Color primaryColorLight = Color(0xFFf85187);
const Color mainTextColor = Color.fromARGB(255, 40, 40, 40);

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLight = ThemeData.light();
    return systemLight.copyWith(
        iconTheme: getIconTheme(),
        textTheme: getTextThemes()
            .apply(bodyColor: mainTextColor, displayColor: mainTextColor));
  }
}
