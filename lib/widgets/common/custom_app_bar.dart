import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_study_app/config/themes/app_icons.dart';
import 'package:flutter_study_app/config/themes/custom_text_styles.dart';
import 'package:flutter_study_app/config/themes/ui_parameters.dart';
import 'package:flutter_study_app/screens/questions/test_overview_screen.dart';
import 'package:flutter_study_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title = '',
      this.leading,
      this.showActionIcon = false,
      this.onMenuActionTap,
      this.titleWidget});
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mobileScreenPadding, vertical: mobileScreenPadding),
        child: Stack(
          children: [
            Positioned.fill(
                child: titleWidget == null
                    ? Center(
                        child: Text(
                          title,
                          style: appBarTS,
                        ),
                      )
                    : Center(
                        child: titleWidget,
                      )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    Transform.translate(
                        offset: const Offset(-14, 0), child: BackButton()),
                if (showActionIcon)
                  Transform.translate(
                    offset: const Offset(10, 0),
                    child: AppCircleButton(
                      onTap: onMenuActionTap ??
                          () => Get.toNamed(TestOverviewScreen.routeName),
                      child: Icon(AppIcons.menu),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
