import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  bool isLogged = true;
  Rxn<User?> user = Rxn();
  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
    isLogged = false;
  }

  void signIn() {
    Get.find<AuthController>().signInWithGoogle();
  }

  void eMail() {
    final Uri emailLauncher =
        Uri(scheme: 'mailto', path: 'samuelbaldasso93@gmail.com');
    _launch(emailLauncher.toString());
  }

  void website() {
    _launch("https://www.github.com/samuelbaldasso/");
  }

  void facebook() {
    _launch("https://www.facebook.com/samukabaldasso/");
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw 'Could not launch $url';
    }
  }
}
