import 'package:extended_sliver/extended_sliver.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mikan/route_navigation/route.dart';
import '../../controller/collection_package.dart';
import '../../resource/screen.dart';

class SettingFragment extends GetView<ListController> {
  const SettingFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener(
            onNotification: (notification) {
              if (notification is OverscrollIndicatorNotification) {
                notification.disallowGlow();
              } else if (notification is ScrollUpdateNotification) {
                if (notification.depth == 0) {
                  final double offset = notification.metrics.pixels;
                  controller.hasScrolledSet = offset > 0.0;
                }
              }
              return true;
            },
            child:
                CustomScrollView(slivers: [_buildHeader(), _settingMenu()])));
  }

  _settingMenu() {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        sliver: SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Get.theme.backgroundColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(16.0))),
                child: Column(children: [
                  ListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      onTap: () {
                        Get.toNamed(notificationRoute);
                      },
                      title: const Text('Notification',
                          style: TextStyle(fontSize: 15)),
                      leading: const Icon(FluentIcons.number_row_16_regular)),
                  const Divider(),
                  ListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      onTap: () {
                        Get.toNamed(changePasswordRoute);
                      },
                      title: const Text('Change password',
                          style: TextStyle(fontSize: 15)),
                      leading: const Icon(FluentIcons.edit_24_regular)),
                  const Divider(),
                  ListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      onTap: () {},
                      title: const Text('Profile edit',
                          style: TextStyle(fontSize: 15)),
                      leading: const Icon(FluentIcons.person_24_regular)),
                  const Divider(),
                  ListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      onTap: () {},
                      title: const Text('Chat', style: TextStyle(fontSize: 15)),
                      leading: const Icon(FluentIcons.chat_24_regular)),
                  const Divider(),
                  ListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      onTap: () {},
                      title:
                          const Text('Logout', style: TextStyle(fontSize: 15)),
                      leading: const Icon(FluentIcons.lock_closed_24_regular))
                ]))));
  }

  _buildHeader() {
    return SliverPinnedToBoxAdapter(
        child: Obx(() => AnimatedContainer(
            decoration: BoxDecoration(
                color: controller.hasScrolled
                    ? Get.theme.backgroundColor
                    : Get.theme.scaffoldBackgroundColor,
                borderRadius: scrollHeaderBorderRadius(controller.hasScrolled),
                boxShadow: scrollHeaderBoxShadow(controller.hasScrolled)),
            padding: EdgeInsets.only(
                top: 16.0 + Screen.statusBarHeight,
                left: 16.0,
                right: 16.0,
                bottom: 16.0),
            duration: const Duration(milliseconds: 240),
            child: Row(children: const <Widget>[Text('Setting')]))));
  }

  BorderRadius scrollHeaderBorderRadius(final bool hasScrolled) => hasScrolled
      ? const BorderRadius.only(
          bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0))
      : BorderRadius.zero;

  List<BoxShadow> scrollHeaderBoxShadow(final bool hasScrolled) => hasScrolled
      ? [
          BoxShadow(
              color: Colors.black.withOpacity(0.024),
              offset: const Offset(0, 1),
              blurRadius: 3.0,
              spreadRadius: 3.0)
        ]
      : const [];
}
