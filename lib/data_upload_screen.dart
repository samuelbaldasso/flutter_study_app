import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_study_app/controllers/question_paper/data_upload.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);
  DataUpload controller = Get.put(DataUpload());
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Obx(() => 
      
      Text(controller.loadingStatus.value==LoadingStatus.completed? "Uploading completed..." : "Uploading...")
    )));
  }
}