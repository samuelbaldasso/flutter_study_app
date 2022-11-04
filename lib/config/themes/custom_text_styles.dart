import 'package:flutter/material.dart';
import 'package:flutter_study_app/config/themes/app_colors.dart';
import 'package:flutter_study_app/config/themes/ui_parameters.dart';
import 'package:get/get.dart';

TextStyle cardTitle(context) => TextStyle(
    color: UIParameters.isDarkMode()
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold);

const kQuizeTS = TextStyle(fontSize: 16, fontWeight: FontWeight.w800);
const detailText = TextStyle(fontSize: 12);
const detailTextBigger = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: onSurfaceTextColor);
const appBarTS = TextStyle(
    fontWeight: FontWeight.bold, color: onSurfaceTextColor, fontSize: 16);

TextStyle countdownTS() => TextStyle(
    letterSpacing: 2,
    color: UIParameters.isDarkMode()
        ? Theme.of(Get.context!).textTheme.bodyText1!.color
        : Theme.of(Get.context!).primaryColor);
