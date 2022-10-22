import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Future<void> dataUpload() async {
    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final papersInAssets = manifestMap.keys
        .where((element) =>
            element.startsWith("assets/DB/papers") && element.contains(".json"))
        .toList();

    List<QuestionPaperModel> questionPaper = [];
    for (var paper in papersInAssets) {
      String stringContent = await rootBundle.loadString(paper);
      questionPaper.add(QuestionPaperModel.fromJson(jsonDecode(stringContent)));
      // print("Items: ${questionPaper.length}");
      var batch = fireStore.batch();
    }
  }
}
