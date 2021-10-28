import 'package:extended_sliver/extended_sliver.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../route_navigation/route.dart';
import '../../controller/collection_package.dart';
import '../../resource/screen.dart';
import '../widget/tap_scale_container.dart';
import '../../resource/app_color.dart';
import '../widget/refresh_indicator.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

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
            child: CustomScrollView(slivers: [_buildHeader(), _buildList()])));
  }

  _buildList() {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: TapScaleContainer(
                  onTap: () {
                    Get.toNamed(orderDetailRoute);
                  },
                  decoration: BoxDecoration(
                      color: Get.theme.backgroundColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Padding(
                            padding: EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 16.0),
                            child: Text('Notification',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    height: 1.25))),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 8.0),
                            child: Tooltip(
                                message: 'Order dispatched',
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8.0),
                                margin: EdgeInsets.only(
                                    top: 136.0 + Screen.statusBarHeight,
                                    left: 16.0,
                                    right: 16.0,
                                    bottom: 24.0),
                                child: const Text(
                                    'Order is dispatched successful 00001',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14.0,
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
                                          fontSize: 12.0,
                                          color: Colors.black))),
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
                              icon: const Icon(FluentIcons.heart_24_regular),
                              color: Get.theme.secondaryHeaderColor,
                              tooltip: 'Add to favorite',
                              iconSize: 20.0,
                              onPressed: () {}),
                          IconButton(
                              icon: const Icon(FluentIcons.delete_24_regular),
                              color: Get.theme.secondaryHeaderColor,
                              tooltip: 'Delete',
                              iconSize: 20.0,
                              onPressed: () {})
                        ])
                      ])));
        }, childCount: 12)));
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
            child: Row(children: [
              GestureDetector(
                  child: const CircleAvatar(
                      radius: 14,
                      child: Icon(FluentIcons.arrow_left_24_regular, size: 15)),
                  onTap: () {
                    FocusScope.of(Get.context!).requestFocus(FocusNode());
                    Get.back();
                  }),
              const SizedBox(width: 10),
              const Text('Notification')
            ]))));
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
