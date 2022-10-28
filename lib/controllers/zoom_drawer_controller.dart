import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }
}
