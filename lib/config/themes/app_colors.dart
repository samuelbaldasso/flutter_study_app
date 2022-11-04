import 'package:flutter/material.dart';
import 'package:flutter_study_app/config/themes/app_dark_theme.dart';
import 'package:flutter_study_app/config/themes/app_light_theme.dart';
import 'package:flutter_study_app/config/themes/ui_parameters.dart';
import 'package:get/get.dart';

const Color onSurfaceTextColor = Colors.white;
const Color correctAnswer = Color(0xFF3ac3cb);
const Color wrongAnswer = Color(0xFF85187);
const Color notAnswered = Color(0xFF2a3c65);

const mainLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight]);

const mainLinearGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorDark, primaryColorDark]);

LinearGradient mainGradient() =>
    UIParameters.isDarkMode() ? mainLinearGradientDark : mainLinearGradient;

Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode()
    ? const Color(0xFF2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);

Color answerSelectedColor() => UIParameters.isDarkMode()
    ? Theme.of(Get.context!).cardColor.withOpacity(0.5)
    : Theme.of(Get.context!).primaryColor;

Color answerBorderColor() => UIParameters.isDarkMode()
    ? Color.fromARGB(255, 20, 46, 158)
    : Color.fromARGB(255, 221, 221, 221);
