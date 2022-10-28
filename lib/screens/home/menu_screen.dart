import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_study_app/config/themes/app_colors.dart';

class MyMenuScreen extends StatelessWidget {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: mainGradient()),
    );
  }
}
