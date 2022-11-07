import 'package:flutter_study_app/controllers/question_controller.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_study_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_study_app/screens/home/home_screen.dart';
import 'package:flutter_study_app/screens/home/question_card.dart';
import 'package:flutter_study_app/screens/introduction/introduction.dart';
import 'package:flutter_study_app/screens/login/login_screen.dart';
import 'package:flutter_study_app/screens/questions/answer_check_screen.dart';
import 'package:flutter_study_app/screens/questions/question_screen.dart';
import 'package:flutter_study_app/screens/questions/result_screen.dart';
import 'package:flutter_study_app/screens/questions/test_overview_screen.dart';
import 'package:flutter_study_app/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/introduction", page: () => const Introduction()),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage(
            name: QuestionScreen.routeName,
            page: () => const QuestionScreen(),
            binding: BindingsBuilder(() {
              Get.put<QuestionsController>(QuestionsController());
            })),
        GetPage(
          name: TestOverviewScreen.routeName,
          page: () => const TestOverviewScreen(),
        ),
        GetPage(
          name: ResultScreen.routeName,
          page: () => const ResultScreen(),
        ),
        GetPage(
          name: AnswerCheckScreen.routeName,
          page: () => const AnswerCheckScreen(),
        ),
      ];
}
