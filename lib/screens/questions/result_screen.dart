import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_study_app/config/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/question_controller.dart';
import 'package:flutter_study_app/controllers/question_paper/question_controller_extension.dart';
import 'package:flutter_study_app/screens/questions/answer_check_screen.dart';
import 'package:flutter_study_app/widgets/common/background_decoration.dart';
import 'package:flutter_study_app/widgets/common/custom_app_bar.dart';
import 'package:flutter_study_app/widgets/common/main_button.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
import 'package:flutter_study_app/widgets/questions/answer_card.dart';
import 'package:flutter_study_app/widgets/questions/question_number_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../config/themes/custom_text_styles.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({super.key});
  static const String routeName = "/resultscreen";

  @override
  Widget build(BuildContext context) {
    Color _textColor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Scaffold(
      appBar: CustomAppBar(
        leading: SizedBox(
          height: 80,
        ),
        title: controller.correctAnsweredQuestions,
      ),
      extendBodyBehindAppBar: true,
      body: Center(
          child: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
              child: ContentArea(
                  child: Column(
                children: [
                  SvgPicture.asset("assets/images/bulb.svg"),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 5),
                    child: Text(
                      'Congratulations...',
                      style: detailTextBigger.copyWith(color: _textColor),
                    ),
                  ),
                  Text(
                    'You have ${controller.points} points.',
                    style: TextStyle(color: _textColor),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Tap below questions numbers to view correct answers.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: controller.allQuestions.length,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Get.width ~/ 75,
                            childAspectRatio: 1,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8),
                        itemBuilder: (_, index) {
                          final _question = controller.allQuestions[index];
                          AnswerStatus _status = AnswerStatus.notanswered;
                          final _selectedAnswer = _question.selectedAnswer;
                          final _correctAnswer = _question.correctAnswer;
                          if (_selectedAnswer == _correctAnswer) {
                            _status = AnswerStatus.correct;
                          } else if (_question.selectedAnswer == null) {
                            _status = AnswerStatus.wrong;
                          } else {
                            _status = AnswerStatus.wrong;
                          }
                          return QuestionNumberCard(
                              index: index + 1,
                              status: _status,
                              onTap: () {
                                controller.jumpToQuestion(index, goBack: false);
                                Get.toNamed(AnswerCheckScreen.routeName);
                              });
                        }),
                  )
                ],
              )),
            ),
            ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: UIParameters.mobileScreenPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                        onTap: () {
                          controller.tryAgain();
                        },
                        color: Colors.blueGrey,
                        title: 'Try again',
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: MainButton(
                        onTap: () {
                          controller.saveResults();
                        },
                        color: Colors.blueGrey,
                        title: 'Go home',
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
