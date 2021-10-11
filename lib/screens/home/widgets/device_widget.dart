import 'package:flutter/material.dart';
import 'package:locator_x/constants/asset_path.dart';
import 'package:locator_x/constants/controllers.dart';
import 'package:locator_x/models/device.dart';
import 'package:locator_x/screens/home/widgets/single_device_draggable.dart';
import 'package:locator_x/widgets/custom_text.dart';

class DeviceWidget extends StatelessWidget {
  final DeviceModel device;

  const DeviceWidget({Key? key, required this.device}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        appController.changeActiveDeviceTo(device);
        appController
            .changeActiveDraggableWidgetTo(const SingleDeviceDraggable());
      },
      leading: Image.asset(
        _returnImage(),
        width: 45,
      ),
      title: CustomText(
        text: device.name ?? "",
        size: 18,
        weight: FontWeight.bold,
      ),
      subtitle: const CustomText(
        text: "Last log 2 days ago",
        color: Colors.grey,
      ),
    );
  }

  String _returnImage() {
    if (device.os == "android") {
      return android;
    } else {
      return iphone;
    }
  }
}
