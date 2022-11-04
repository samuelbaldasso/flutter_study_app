import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_study_app/config/themes/app_colors.dart';
import 'package:get/get.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      this.title = '',
      required this.onTap,
      this.enabled = true,
      this.child,
      this.color});
  final String title;
  final VoidCallback onTap;
  final enabled;
  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 55,
        child: InkWell(
          onTap: enabled == false ? null : onTap,
          child: Center(
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: color ?? Theme.of(context).cardColor),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: child ??
                    Center(
                        child: Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode?onSurfaceTextColor:Theme.of(context).primaryColor
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
