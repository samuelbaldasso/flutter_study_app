import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/config/themes/app_colors.dart';
import 'package:flutter_study_app/config/themes/ui_parameters.dart';

enum AnswerStatus { correct, wrong, answered, notanswered }

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerCard(
      {Key? key,
      required this.answer,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected ? onSurfaceTextColor : null,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: UIParameters.cardBorderRadius,
            color: isSelected
                ? answerSelectedColor()
                : Theme.of(context).cardColor,
            border: Border.all(
                color:
                    isSelected ? answerSelectedColor() : answerBorderColor())),
      ),
    );
  }
}

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({super.key, required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: correctAnswer.withOpacity(0.1)),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        answer,
        style: TextStyle(color: correctAnswer, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class WrongAnswer extends StatelessWidget {
  const WrongAnswer({super.key, required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: wrongAnswer.withOpacity(0.1)),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        answer,
        style: TextStyle(color: wrongAnswer, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class NotAnswered extends StatelessWidget {
  const NotAnswered({super.key, required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: notAnswered.withOpacity(0.1)),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        answer,
        style: TextStyle(color: notAnswered, fontWeight: FontWeight.bold),
      ),
    );
  }
}
