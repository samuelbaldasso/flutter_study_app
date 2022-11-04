import 'package:flutter/material.dart';
import 'package:flutter_study_app/config/themes/app_colors.dart';
import 'package:flutter_study_app/config/themes/custom_text_styles.dart';
import 'package:flutter_study_app/config/themes/ui_parameters.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:flutter_study_app/screens/questions/test_overview_screen.dart';
import 'package:flutter_study_app/widgets/common/custom_app_bar.dart';
import 'package:flutter_study_app/widgets/common/main_button.dart';
import 'package:flutter_study_app/widgets/common/question_placeholder.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
import 'package:flutter_study_app/widgets/questions/answer_card.dart';
import 'package:flutter_study_app/widgets/questions/countdown.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_study_app/controllers/question_controller.dart';
import 'package:flutter_study_app/widgets/common/background_decoration.dart';

class QuestionScreen extends GetView<QuestionsController> {
  const QuestionScreen({super.key});
  static const String routeName = '/questionscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
          leading: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: ShapeDecoration(
                  shape: StadiumBorder(
                      side: BorderSide(color: onSurfaceTextColor, width: 2))),
              child: Obx(() => Countdown(
                    time: controller.time.value,
                    color: onSurfaceTextColor,
                  ))),
          showActionIcon: true,
          titleWidget: Obx(
            () => Text(
              "Q ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}",
              style: appBarTS,
            ),
          )),
      body: BackgroundDecoration(
        child: Obx(() => Column(
              children: [
                if (controller.loadingStatus.value == LoadingStatus.loading)
                  const ContentArea(
                      child: const Expanded(child: QuestionPlaceholder())),
                if (controller.loadingStatus.value == LoadingStatus.completed)
                  Expanded(
                    child: ContentArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(top: 25),
                        child: Column(
                          children: [
                            Text(
                              controller.currentQuestion.value!.question,
                              style: kQuizeTS,
                            ),
                            GetBuilder<QuestionsController>(
                                id: 'answers_list',
                                builder: (context) {
                                  return ListView.separated(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.only(top: 25),
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final answer = controller
                                            .currentQuestion
                                            .value!
                                            .answers[index];
                                        return AnswerCard(
                                            answer:
                                                '${answer.identifier}: ${answer.answer}.',
                                            onTap: () {
                                              controller.selectedAnswer(
                                                  answer.identifier);
                                            },
                                            isSelected: answer.identifier ==
                                                controller.currentQuestion
                                                    .value!.selectedAnswer);
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              SizedBox(
                                                height: 10,
                                              ),
                                      itemCount: controller.currentQuestion
                                          .value!.answers.length);
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ColoredBox(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: UIParameters.mobileScreenPadding,
                    child: Row(
                      children: [
                        Visibility(
                          visible: controller.isFirstQuestion,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: SizedBox(
                              width: 55,
                              height: 55,
                              child: MainButton(
                                onTap: () {
                                  controller.prevQuestion();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Get.isDarkMode
                                        ? onSurfaceTextColor
                                        : Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Visibility(
                            visible: controller.loadingStatus.value ==
                                LoadingStatus.completed,
                            child: MainButton(
                              onTap: () {
                                controller.isLastQuestion
                                    ? Get.toNamed(TestOverviewScreen.routeName)
                                    : controller.nextQuestion();
                              },
                              title: controller.isLastQuestion
                                  ? 'Complete'
                                  : 'Next',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
