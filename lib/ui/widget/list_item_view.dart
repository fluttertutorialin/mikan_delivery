import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resource/icon.dart';
import '../../route_navigation/route.dart';
import '../../resource/screen.dart';
import '../widget/tap_scale_container.dart';

class ListItemView extends StatelessWidget {
  const ListItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        child: TapScaleContainer(
            onTap: () {
              Get.toNamed(orderDetailRoute);
            },
            decoration: BoxDecoration(
                color: Get.theme.backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(16.0))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                      padding:
                          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                      child: Text('Lakhani kamlesh J.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              height: 1.25))),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 8.0),
                      child: Tooltip(
                          message: 'Rs. 1500 (Total 5 Items)',
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          margin: EdgeInsets.only(
                              top: 136.0 + Screen.statusBarHeight,
                              left: 16.0,
                              right: 16.0,
                              bottom: 24.0),
                          child: const Text('Rs. 1500 (Total 5 Items)',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  height: 1.25,
                                  fontWeight: FontWeight.w500)))),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 8.0),
                      child: Tooltip(
                          message: 'Address',
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          margin: EdgeInsets.only(
                              top: 136.0 + Screen.statusBarHeight,
                              left: 16.0,
                              right: 16.0,
                              bottom: 24.0),
                          child: const Text(
                              'To. Ravani (Kuba) Ta. Visavadar Dis. Junagadh 362130',
                              style: TextStyle(
                                  fontSize: 13.0,
                                  height: 1.25,
                                  fontWeight: FontWeight.w500)))),
                  const SizedBox(height: 4.0),
                  Row(children: <Widget>[
                    Container(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        margin: const EdgeInsets.only(left: 16.0),
                        child: const Center(
                            child: Text('27-11-2021 10:15 AM',
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.black))),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.grey.withOpacity(0.1),
                                  Colors.grey.withOpacity(0.1),
                                ]))),
                    const Spacer(),
                    IconButton(
                        icon: const Icon(mapIcon),
                        color: Get.theme.secondaryHeaderColor,
                        tooltip: 'Map',
                        iconSize: 20.0,
                        onPressed: () {}),
                    IconButton(
                        icon: const Icon(callIcon),
                        color: Get.theme.secondaryHeaderColor,
                        tooltip: 'Phone',
                        iconSize: 20.0,
                        onPressed: () {}),
                    IconButton(
                        icon: const Icon(chatIcon),
                        color: Get.theme.secondaryHeaderColor,
                        tooltip: 'Chat',
                        iconSize: 20.0,
                        onPressed: () {})
                  ])
                ])));
  }
}
