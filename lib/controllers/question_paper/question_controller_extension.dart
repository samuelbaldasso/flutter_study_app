import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/controllers/question_controller.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:get/get.dart';
import '../auth_controller.dart';

extension QuestionsControllerExtension on QuestionsController {
  int get correctAnswerCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctAnsweredQuestions {
    return "$correctAnswerCount out of ${allQuestions.length} are correct.";
  }

  String get points {
    var points = (correctAnswerCount / allQuestions.length) *
        100 *
        (questionPaperModel.timeSeconds - remainSeconds) /
        questionPaperModel.timeSeconds *
        100;
    return points.toStringAsFixed(2);
  }

  Future<void> saveResults() async {
    var batch = fireStore.batch();
    User? user = Get.find<AuthController>().getUser();
    if (user == null) {
      return;
    }
    batch.set(
      userRF
          .doc(user.email)
          .collection("my_recent_tests")
          .doc(questionPaperModel.id),
      {
        "points": points,
        "correct_answer": "$correctAnswerCount/${allQuestions.length}",
        "question_id": questionPaperModel.id,
        "time": questionPaperModel.timeSeconds - remainSeconds
      },
    );
    batch.commit();
    navigateToHome();
  }
}
