import 'package:flutter/material.dart';
import 'package:locator_x/constants/asset_path.dart';
import 'package:locator_x/constants/controllers.dart';
import 'package:locator_x/widgets/custom_text.dart';

import 'device_action_button.dart';
import 'devices_draggable.dart';

class SingleDeviceDraggable extends StatelessWidget {
  const SingleDeviceDraggable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: .3,
        builder: (context, scrollable) {
          return Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.8),
                  offset: const Offset(3, 2),
                  blurRadius: 7)
            ]),
            child: ListView(
              controller: scrollable,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      height: 6,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: CustomText(
                          text: appController.activeDevice.value.name ?? "",
                          size: 22,
                          weight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            appController.changeActiveDraggableWidgetTo(
                                const DevicesDraggable());
                          })
                    ]),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: CustomText(
                    text: "Last log 2 days ago",
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DeviceActionButton(
                          image: locationIcon, text: "Locations", onTap: () {}),
                      DeviceActionButton(
                          image: routeIcon, text: "Directions", onTap: () {}),
                      Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.5),
                                  blurRadius: 3,
                                )
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {}))
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
