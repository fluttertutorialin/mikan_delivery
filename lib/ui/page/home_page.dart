import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../controller/collection_package.dart';
import '../widget/bottom_bar_view.dart';
import '../../resource/screen.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
          child: Obx(() => IndexedStack(
              children: [Container(), Container(), Container(), Container()], index: controller.selectIndex))),
      Positioned(
          bottom: 16 + Screen.navBarHeight,
          left: 24.0,
          right: 24.0,
          child: Center(
              child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560.0),
                  child: Obx(() => BottomBarView(items: [
                    BarItem(
                        icon: FluentIcons.home_24_regular,
                        selectedIcon: FluentIcons.home_24_regular,
                        isSelected: controller.selectIndex == 0),
                    BarItem(
                        icon: FluentIcons.search_24_regular,
                        selectedIcon: FluentIcons.search_24_regular,
                        isSelected: controller.selectIndex == 1),
                    BarItem(
                        icon: FluentIcons.person_24_regular,
                        selectedIcon: FluentIcons.person_24_regular,
                        isSelected: controller.selectIndex == 2),
                    BarItem(
                        icon: FluentIcons.settings_24_regular,
                        selectedIcon: FluentIcons.settings_24_regular,
                        isSelected: controller.selectIndex == 3)
                  ], onItemClick: (index) {
                    controller.selectIndexItem(index);
                  })))))
    ]));
  }
}
