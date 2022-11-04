import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_study_app/config/themes/custom_text_styles.dart';
import 'package:flutter_study_app/config/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/question_controller.dart';
import 'package:flutter_study_app/screens/home/question_card.dart';
import 'package:flutter_study_app/widgets/common/background_decoration.dart';
import 'package:flutter_study_app/widgets/common/custom_app_bar.dart';
import 'package:flutter_study_app/widgets/common/main_button.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
import 'package:flutter_study_app/widgets/questions/answer_card.dart';
import 'package:flutter_study_app/widgets/questions/countdown.dart';
import 'package:flutter_study_app/widgets/questions/question_number_card.dart';
import 'package:get/get.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});
  static const String routeName = '/testoverview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          title: controller.completedTest,
        ),
        body: BackgroundDecoration(
            child: Column(
          children: [
            Expanded(
                child: ContentArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Countdown(
                        time: '',
                        color: UIParameters.isDarkMode()
                            ? Theme.of(context).textTheme.bodyText1!.color
                            : Theme.of(context).primaryColor,
                      ),
                      Obx(
                        () => Text(
                          "${controller.time} remaining...",
                          style: countdownTS(),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: GridView.builder(
                    itemCount: controller.allQuestions.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width ~/ 75,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                    itemBuilder: (BuildContext context, int index) {
                      AnswerStatus? answer;
                      if (controller.allQuestions[index].selectedAnswer !=
                          null) {
                        answer = AnswerStatus.answered;
                      }
                      return QuestionNumberCard(
                          index: index + 1,
                          status: answer,
                          onTap: () => controller.jumpToQuestion(index));
                    },
                  ))
                ],
              ),
            )),
            ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                    padding: UIParameters.mobileScreenPadding,
                    child: MainButton(
                      onTap: () {},
                      title: 'Complete',
                    ))),
          ],
        )));
  }
}
