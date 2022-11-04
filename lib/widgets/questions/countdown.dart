import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_study_app/config/themes/custom_text_styles.dart';

class Countdown extends StatelessWidget {
  const Countdown({super.key, this.color, required this.time});
  final Color? color;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: color ?? Theme.of(context).primaryColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          time,
          style: countdownTS().copyWith(color: color),
        ),
      ],
    );
  }
}
