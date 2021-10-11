import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:locator_x/models/device.dart';
import 'package:locator_x/screens/home/widgets/devices_draggable.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();
  Rx<Widget> activeDraggableWidget = Rx<Widget>(const DevicesDraggable());
  Rx<DeviceModel> activeDevice = DeviceModel().obs;
  RxBool isLoginWidgetDisplayed = true.obs;

  changeDisplayedAuthWidget() {
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }

  changeActiveDeviceTo(DeviceModel device) {
    activeDevice.value = device;
  }

  changeActiveDraggableWidgetTo(Widget widget) {
    activeDraggableWidget.value = widget;
  }
}
