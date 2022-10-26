import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    navigateToIntro();
  }

  void navigateToIntro() {
    Get.offAllNamed("/introduction");
  }

  // void navigateToHome() {
  //   Get.offAllNamed("/home");
  // }
}
