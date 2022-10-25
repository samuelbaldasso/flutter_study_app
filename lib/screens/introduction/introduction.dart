import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_study_app/config/themes/app_colors.dart';
import 'package:get/get.dart';
import '../../widgets/app_circle_button.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(alignment: Alignment.center,
      decoration: BoxDecoration(gradient: mainGradient(context)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width*0.2),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, 
          children: [
          const Icon(Icons.star, size: 65),
          SizedBox(height: 40),
          const Text("This is a study app. You can use it as you want. If you understand how this works, you will be able to scale it.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: onSurfaceTextColor,
              fontWeight: FontWeight.bold
            )
          ),
          SizedBox(height: 40,),
          AppCircleButton(
            onTap: (() => null),
            child: const Icon(Icons.arrow_forward, size: 35,),
          )
        ],),
      ),
      ),
    );
  }
}
