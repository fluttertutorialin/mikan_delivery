import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'list_fragment.dart';
import 'profile_fragment.dart';
import 'search_fragment.dart';
import 'setting_fragment.dart';
import '../../controller/collection_package.dart';
import '../widget/bottom_bar_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            statusBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
        child: Scaffold(
            bottomNavigationBar: SizedBox(
                height: 60,
                child: Center(
                    child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 560.0),
                        child: Obx(() => BottomBarView(
                                items: [
                                  BarItem(
                                      icon: FluentIcons.home_24_regular,
                                      selectedIcon: FluentIcons.home_24_regular,
                                      isSelected: controller.selectIndex == 0),
                                  BarItem(
                                      icon: FluentIcons.search_24_regular,
                                      selectedIcon:
                                          FluentIcons.search_24_regular,
                                      isSelected: controller.selectIndex == 1),
                                  BarItem(
                                      icon: FluentIcons.person_24_regular,
                                      selectedIcon:
                                          FluentIcons.person_24_regular,
                                      isSelected: controller.selectIndex == 2),
                                  BarItem(
                                      icon: FluentIcons.settings_24_regular,
                                      selectedIcon:
                                          FluentIcons.settings_24_regular,
                                      isSelected: controller.selectIndex == 3)
                                ],
                                onItemClick: (index) {
                                  controller.selectIndexItem(index);
                                }))))),
            body: Stack(children: [
              Obx(() => IndexedStack(children: const [
                    ListFragment(),
                    SearchFragment(),
                    ProfileFragment(),
                    SettingFragment()
                  ], index: controller.selectIndex)),
            ])));
  }
}
