import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_study_app/config/themes/ui_parameters.dart';
import 'package:flutter_study_app/screens/home/question_card.dart';
import 'package:get/get.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
        body: Obx(
      () => ListView.separated(
        padding: UIParameters.mobileScreenPadding,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return QuestionCard(
            model: _questionPaperController.allPapers[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 20);
        },
        itemCount: _questionPaperController.allPapers.length,
      ),
    ));
  }
}
