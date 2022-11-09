import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_study_app/config/themes/app_colors.dart';
import 'package:flutter_study_app/config/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/zoom_drawer_controller.dart';
import 'package:get/get.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: UIParameters.mobileScreenPadding,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Theme(
          data: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(primary: onSurfaceTextColor))),
          child: SafeArea(
            child: Stack(children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: () {
                      controller.toogleDrawer();
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3),
                child: Column(
                  children: [
                    Obx(
                      () => controller.user.value == null
                          ? const SizedBox()
                          : Text(controller.user.value!.displayName ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: onSurfaceTextColor)),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    _DrawerButton(
                      icon: Icons.web,
                      label: "Website",
                      onPressed: () => controller.website(),
                    ),
                    _DrawerButton(
                      icon: Icons.facebook,
                      label: "Facebook",
                      onPressed: () => controller.website(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: _DrawerButton(
                        icon: Icons.email,
                        label: "Email",
                        onPressed: () => controller.eMail(),
                      ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    Obx(
                      () => _DrawerButton(
                        icon: Icons.logout,
                        label: controller.user.value == null
                            ? "Sign in"
                            : "Logout",
                        onPressed: () => controller.user.value == null
                            ? controller.signIn()
                            : controller.signOut(),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {super.key, required this.icon, required this.label, this.onPressed});
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 15,
      ),
      label: Text(label),
    );
  }
}
