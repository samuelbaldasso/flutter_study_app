import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton(
      {Key? key, required this.child, this.color, this.width = 60, this.onTap})
      : super(key: key);
  final Widget child;
  final double width;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        shape: const CircleBorder(),
        clipBehavior: Clip.none,
        child: InkWell(child: child, onTap: onTap,));
  }
}
