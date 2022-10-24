import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_study_app/controllers/question_paper/data_upload.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);
  DataUpload controller = Get.put(DataUpload());
  
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("uploading..."))
    );
  }
}