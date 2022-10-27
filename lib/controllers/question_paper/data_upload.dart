import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataUpload extends GetxController {
  @override
  void onReady() {
    dataUpload();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;
  Future<void> dataUpload() async {
    loadingStatus.value = LoadingStatus.loading;
    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await rootBundle.loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final papersInAssets = manifestMap.keys
        .where((element) =>
            element.startsWith("assets/DB/papers") && element.contains(".json"))
        .toList();

    List<QuestionPaperModel> questionPaper = [];
    for (var paper in papersInAssets) {
      String stringContent = await rootBundle.loadString(paper);
      questionPaper.add(QuestionPaperModel.fromJson(json.decode(stringContent)));
      var batch = fireStore.batch();
      for (var paper in questionPaper) {
        batch.set(questionPaperRF.doc(paper.id), {
          "title": paper.title,
          "imageUrl": paper.imageUrl,
          "Description": paper.description,
          "time_seconds": paper.timeSeconds,
          "question_count":
              paper.questions == null ? 0 : paper.questions!.length
        });

        for (var questions in paper.questions!) {
          final questionPath =
              questionRF(paperId: paper.id, questionId: questions.id);
          batch.set(questionPath, {
            "question": questions.question,
            "correct_answer": questions.correctAnswer
          });
          for (var answer in questions.answers!) {
            batch.set(questionPath.collection("answers").doc(answer.identifier),
                {"identifier": answer.identifier, "answers": answer.answer});
          }
        }
      }
      await batch.commit();
      loadingStatus.value = LoadingStatus.completed;
    }
  }
}
