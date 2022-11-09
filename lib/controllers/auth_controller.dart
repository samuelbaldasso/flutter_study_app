import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:flutter_study_app/screens/login/login_screen.dart';
import 'package:flutter_study_app/utils/app_logger.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

import '../screens/home/home_screen.dart';
import '../widgets/dialogs/dialog.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntro();
  }

  signInWithGoogle() async {
    final GoogleSignIn _google = GoogleSignIn();
    try {
      GoogleSignInAccount? _signIn = await _google.signIn();
      if (_signIn != null) {
        final _authAccount = await _signIn.authentication;
        final credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);
        await _auth.signInWithCredential(credential);
        await saveUser(_signIn);
        navigateToHome();
      }
    } on Exception catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToIntro() {
    Get.offAllNamed("/introduction");
  }

  void showLoginDialog() {
    Get.dialog(Dialog.questionStartDialog(onTap: () {
      Get.back();
      navigateToLogin();
    }), barrierDismissible: false);
  }

  saveUser(GoogleSignInAccount signIn) {
    userRF.doc(signIn.email).set({
      "email": signIn.email,
      "name": signIn.displayName,
      "profilepic": signIn.photoUrl
    });
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  void navigateToLogin() {
    Get.toNamed(LoginScreen.routeName);
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  Future<void> signOut() async {
    AppLogger.d('Signed out...');
    try {
      await _auth.signOut();
      navigateToHome();
    } on FirebaseAuthException catch (e) {
      AppLogger.e(e);
    }
  }

  navigateToHome() {
    Get.offAllNamed(HomeScreen.routeName);
  }
}
