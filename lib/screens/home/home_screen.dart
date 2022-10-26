import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
        body: Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            child: SizedBox(
              height: 200,
              width: 200,
              child: CachedNetworkImage(
                  imageUrl: questionPaperController.allPapers[index].imageUrl!,
                  placeholder: (context, url) => 
                        Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ), 
                    errorWidget: (context, url, error) => Image.asset("assets/images/app_splash_logo.png")),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 20);
        },
        itemCount: questionPaperController.allPapers.length,
      ),
    ));
  }
}
