import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_study_app/config/themes/app_colors.dart';
import 'package:flutter_study_app/config/themes/app_icons.dart';
import 'package:flutter_study_app/config/themes/custom_text_styles.dart';
import 'package:flutter_study_app/config/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_study_app/screens/home/question_card.dart';
import 'package:flutter_study_app/widgets/app_circle_button.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
import 'package:flutter_study_app/screens/home/menu_screen.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(body: GetBuilder<MyZoomDrawerController>(builder: (_) {
      return ZoomDrawer(
        menuScreenWidth: double.maxFinite,
        borderRadius: 50.0,
        controller: _.zoomDrawerController,
        showShadow: false,
        moveMenuScreen: false,
        angle: 0.0,
        slideWidth: MediaQuery.of(context).size.width * 0.7,
        menuScreen: const MyMenuScreen(),
        mainScreen: Container(
          decoration: BoxDecoration(gradient: mainGradient()),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(mobileScreenPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppCircleButton(
                        child: const Icon(
                          AppIcons.menuLeft,
                        ),
                        onTap: controller.toogleDrawer,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const Icon(
                              AppIcons.peace,
                            ),
                            Text(
                              "Hello friend",
                              style: detailText.copyWith(
                                  color: onSurfaceTextColor),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "What do you wanna learn today?",
                        style: detailTextBigger,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ContentArea(
                      addPadding: false,
                      child: Scaffold(
                          body: Obx(
                        () => ListView.separated(
                          padding: UIParameters.mobileScreenPadding,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return QuestionCard(
                              model: _questionPaperController.allPapers[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 20);
                          },
                          itemCount: _questionPaperController.allPapers.length,
                        ),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }));
  }
}
